module Yandex
    class Translator
        module Translate

            def translate(args = {})
                check_args(text: args[:text], to: args[:to])
                translate_direction = args[:from].nil? ? args[:to] : "#{args[:from]}-#{args[:to]}"
                response = call('/translate', { lang: translate_direction, text: args[:text] })
                JSON.parse(response.body)['text']
            rescue YandexFailure => ex
                return { error: ex.message }
            end
            
        end
    end
end