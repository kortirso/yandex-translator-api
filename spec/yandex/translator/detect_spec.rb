require 'spec_helper'

describe Yandex::Translator::Detect do
    describe '.detect' do
        let(:translator) { Yandex::Translator.new }

        context 'for bad request' do
            context 'for bad params' do
                it 'returns hash error with message' do
                    response = translator.detect

                    expect(response.is_a?(Hash)).to eq true
                    expect(response[:error]).to eq "Invalid argument 'text', must be string"
                end
            end
        end

        context 'for correct request' do
            it 'returns locale for the text' do
                stub_request(:post, 'https://translate.yandex.net/api/v1.5/tr.json/detect').
                    to_return(status: 200, body: '{"lang":"ru"}', headers: {})

                expect(translator.detect(text: 'Привет')).to eq 'ru'
            end
        end
    end
end