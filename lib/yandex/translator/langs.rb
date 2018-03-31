module Yandex
  class Translator
    # Available languages module
    module Langs
      # Get list of available languages for translation
      def langs
        response = request('/getLangs')
        response.parsed_response
      rescue YandexFailure => ex
        return { error: ex.message }
      end
    end
  end
end
