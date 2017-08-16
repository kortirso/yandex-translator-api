module Yandex
    class Translator
        module Detect

            def detect(args)
                check_args(text: args[:text])
                response = call('/detect', { hint: args[:hint], text: args[:text] })
                JSON.parse(response.body)['lang']
            rescue YandexFailure => ex
                return { error: ex.message }
            end

        end
    end
end