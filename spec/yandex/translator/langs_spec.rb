require 'spec_helper'

describe Yandex::Translator::Langs do
    describe '.langs' do
        let(:translator) { Yandex::Translator.new }

        it 'returns array with translate directions' do
            stub_request(:post, 'https://translate.yandex.net/api/v1.5/tr.json/getLangs').
                to_return(status: 200, body: '{"dirs":["en-da", "en-de"]}', headers: {})

            expect(translator.langs).to eq ['en-da', 'en-de']
        end
    end
end