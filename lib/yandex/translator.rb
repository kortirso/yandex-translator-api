require_relative 'translator/langs'
require_relative 'translator/detect'
require_relative 'translator/translate'
require 'net/http'
require 'json'

module Yandex
    class Translator
        include Yandex::Translator::Langs
        include Yandex::Translator::Detect
        include Yandex::Translator::Translate

        class YandexFailure < StandardError; end

        attr_reader :api_key, :base_uri

        def initialize(api_key = '')
            @api_key = api_key
            @base_uri = 'https://translate.yandex.net/api/v1.5/tr.json'
        end

        private

        def call(address, args = {})
            response = http_request(address, args)
            check_response(response)
            response
        end

        def http_request(address, args)
            uri = URI("#{base_uri}#{address}")
            req = Net::HTTP::Post.new(uri)
            req.set_form_data(args.merge(key: api_key))
            Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) { |http| http.request(req) }
        end

        def check_response(response)
            if response.code != '200'
                raise YandexFailure, JSON.parse(response.body)['message']
            end
        end

        def check_args(args)
            args.each do |arg_name, value|
                if value.nil? || !value.is_a?(String)
                    raise YandexFailure, "Invalid argument '#{arg_name}', must be string"
                end
            end
        end
    end
end