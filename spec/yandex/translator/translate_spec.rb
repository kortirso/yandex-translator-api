require 'spec_helper'

describe Yandex::Translator::Translate do
    describe '.translate' do
        let(:translator) { Yandex::Translator.new }

        it 'returns localized text' do
            stub_request(:post, 'https://translate.yandex.net/api/v1.5/tr.json/translate').
                to_return(status: 200, body: '{"text":"Hello"}', headers: {})

            expect(translator.translate(text: 'Привет', from: 'ru', to: 'en')).to eq 'Hello'
        end
    end
end