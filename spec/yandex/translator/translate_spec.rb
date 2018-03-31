describe Yandex::Translator::Translate do
  describe '.translate' do
    let(:translator) { Yandex::Translator.new }

    context 'for bad request' do
      context 'for bad params' do
        it 'returns hash error with message' do
          response = translator.translate(text: 'Привет', from: 'ru')

          expect(response.is_a?(Hash)).to eq true
          expect(response[:error]).to eq "Invalid argument 'to', must be string"
        end
      end

      context 'for bad request to Yandex' do
        it 'returns hash error with message' do
          skip
          stub_request(:post, 'https://translate.yandex.net/api/v1.5/tr.json/translate')
            .to_return(status: 501, body: '{"code":501,"message":"The specified translation direction is not supported"}', headers: {})
          response = translator.translate(text: 'Hello', from: 'ru', to: 'ch')

          expect(response.is_a?(Hash)).to eq true
          expect(response[:error]).to eq 'The specified translation direction is not supported'
        end
      end
    end

    context 'for correct request' do
      it 'returns localized text' do
        skip
        stub_request(:post, 'https://translate.yandex.net/api/v1.5/tr.json/translate')
          .to_return(status: 200, body: '{"text":"Hello"}', headers: {})

        expect(translator.translate(text: 'Привет', from: 'ru', to: 'en')).to eq 'Hello'
      end
    end
  end
end
