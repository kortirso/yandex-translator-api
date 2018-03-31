module Yandex
  class Translator
    # Translate module
    module Translate
      # Translate text
      def translate(args = {})
        check_args(text: args[:text], to: args[:to])
        translate_direction = args[:from].nil? ? args[:to] : "#{args[:from]}-#{args[:to]}"
        response = request('/translate', lang: translate_direction, text: args[:text])
        response.parsed_response
      rescue YandexFailure => ex
        return { error: ex.message }
      end
    end
  end
end
