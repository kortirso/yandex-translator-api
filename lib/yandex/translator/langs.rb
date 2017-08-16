module Yandex
    class Translator
        module Langs

            def langs
                response = call('/getLangs')
                JSON.parse(response.body)['dirs']
            rescue YandexFailure => ex
                return { error: ex.message }
            end
            
        end
    end
end