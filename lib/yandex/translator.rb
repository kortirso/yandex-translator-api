require 'httparty'
require_relative 'translator/langs'
require_relative 'translator/detect'
require_relative 'translator/translate'

module Yandex
  # Translator class
  class Translator
    class YandexFailure < StandardError; end

    include HTTParty
    include Yandex::Translator::Langs
    include Yandex::Translator::Detect
    include Yandex::Translator::Translate

    base_uri 'https://translate.yandex.net/api/v1.5/tr.json'
    format :json

    attr_reader :api_key

    def initialize(args = {})
      @api_key = args[:api_key]
    end

    private def request(uri, args = {})
      response = self.class.post(uri, query: args.merge(key: api_key))
      check_response(response)
      response
    end

    private def check_response(response)
      if response.code != 200
        error_message = response.message.empty? ? response.code : response.message
        raise YandexFailure, error_message
      end
    end

    private def check_args(args)
      args.each do |arg_name, value|
        if value.nil? || !value.is_a?(String)
          raise YandexFailure, "Invalid argument '#{arg_name}', must be string"
        end
      end
    end
  end
end
