# EncryptableAttributes [![Build Status](https://travis-ci.org/nsommer/encryptable_attributes.svg?branch=master)](https://travis-ci.org/nsommer/encryptable_attributes)

With the `encryptable_attributes` gem, you transparently encrypt and decrypt attributes of an ActiveRecord model. It uses `ActiveSupport::MessageEncryptor` to encrypt and decrypt values and provides a simple class-level DSL for configuration.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'encryptable_attributes'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install encryptable_attributes

## Usage

Consider a simple ActiveRecord model `Message` with a `title` and a `body` field. To store those attributes' values encrypted, use the following code snippet.

```ruby
class Message < ActiveRecord::Base
  include EncryptableAttributes::Base
  
  secure_key ENV.fetch('SECRET_KEY')
  secure_attrs :title, :body
end
```

ActiveRecord models use an `attributes` hash internally to keep attributes. EncryptablesAttributes overrides the accessor methods for the corresponding attributes and encrypts given values before storing them in the `attributes` hash and decrypts them when reading them from the `attributes` hash.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/nsommer/encryptable_attributes.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
