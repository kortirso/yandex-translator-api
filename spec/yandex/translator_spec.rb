require 'spec_helper'

describe Yandex::Translator do
    describe '.initialize' do
        let(:translator) { Yandex::Translator.new }

        it 'assigns api_key to @api_key' do
            expect(translator.api_key).to eq ''
        end

        it 'assigns base_uri to @base_uri' do
            expect(translator.base_uri).to eq 'https://translate.yandex.net/api/v1.5/tr.json'
        end
    end
end