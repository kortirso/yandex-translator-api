describe Yandex::Translator do
  let(:translator) { Yandex::Translator.new(api_key: '') }

  describe '.initialize' do
    it 'assigns api_key to @api_key' do
      expect(translator.api_key).to eq ''
    end
  end

  describe 'methods' do
    context '.request' do
      context 'for bad request' do
        it 'raises Failure' do
          skip
          stub_request(:post, 'https://translate.yandex.net/api/v1.5/tr.json/translate?key=')
            .to_return(status: 501, body: '{"code":501,"message":"The specified translation direction is not supported"}', headers: {})

          expect { translator.send(:request, '/translate', text: 'Hello', lang: 'ru-ch') }.to raise_error(Yandex::Translator::YandexFailure)
        end
      end

      context 'for correct request' do
        it 'returns response from Yandex' do
          skip
          stub_request(:post, 'https://translate.yandex.net/api/v1.5/tr.json/getLangs?key=')
            .to_return(status: 200, body: '{"dirs":["en-da", "en-de"]}', headers: {})
          response = translator.send(:request, '/getLangs', {})

          expect(response.code).to eq 200
          expect(response.body).to eq '{"dirs":["en-da", "en-de"]}'
        end
      end
    end

    context '.check_args' do
      context 'for nil args' do
        it 'raises Failure' do
          expect { translator.send(:check_args, text: nil) }.to raise_error(Yandex::Translator::YandexFailure)
        end
      end

      context 'for args with value' do
        it 'returns args' do
          expect(translator.send(:check_args, text: 'Text')).to eq(text: 'Text')
        end
      end
    end
  end
end
