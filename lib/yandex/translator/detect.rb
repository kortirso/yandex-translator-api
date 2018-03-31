module Yandex
  class Translator
    # Detection module
    module Detect
      # Detect language
      def detect(args = {})
        check_args(text: args[:text])
        response = request('/detect', hint: args[:hint], text: args[:text])
        response.parsed_response
      rescue YandexFailure => ex
        return { error: ex.message }
      end
    end
  end
end
