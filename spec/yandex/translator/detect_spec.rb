require 'spec_helper'

describe Yandex::Translator::Detect do
    describe '.detect' do
        let(:translator) { Yandex::Translator.new }

        it 'returns locale for the text' do
            stub_request(:post, 'https://translate.yandex.net/api/v1.5/tr.json/detect').
                to_return(status: 200, body: '{"lang":"ru"}', headers: {})

            expect(translator.detect(text: 'Привет')).to eq 'ru'
        end
    end
end