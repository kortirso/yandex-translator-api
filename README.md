# Yandex Translator API

Text translating by Yandex Translator API

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'yandex-translator-api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install yandex-translator-api

## Usage

Create Translator object.

```ruby
    translator = Yandex::Translator.new('api_key')
```

Request for getting possible translation directions is #langs.

```ruby
  translator.langs
```

    It returns array of possible translations or error.

Request for detecting language of the text is #detect.

```ruby
  translator.detect text: 'Hello', hint: 'en,de'
```

    It returns locale of the text or error.
    text - text for detecting, required param
    hint - list of possible languages

Request for translating of the text is #translate.

```ruby
  translator.translate text: 'Hello', from: 'en', to: 'ru'
```

    It returns translated text or error.
    text - text for detecting, required param
    from - language of the text
    to - translating direction, required param

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kortirso/yandex-translator-api.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
