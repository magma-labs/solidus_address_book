# SolidusAddressBook

[![Build Status](https://travis-ci.org/jtapia/solidus_address_book.svg?branch=master)](https://travis-ci.org/jtapia/solidus_address_book)

This extension allows registered users to have multiple shipping & billing addresses and select each of them on checkout.

This extension is a solidus version of [spree_address_book extension](https://github.com/spree-contrib/spree_address_book)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'solidus_address_book', github: 'jtapia/solidus_address_book'
```

Then run the following:

```console
$ bundle install
$ bundle exec rails g solidus_address_book:install
```

## Preview

![account-index](https://user-images.githubusercontent.com/957520/59891993-f2d90180-939c-11e9-8812-1e4aea887734.png)
![checkout user addresses](https://user-images.githubusercontent.com/957520/59891953-d76df680-939c-11e9-8395-6ff728aff51a.png)
![edit address form](https://user-images.githubusercontent.com/957520/59891955-d8068d00-939c-11e9-9b90-1cdf70d75dbe.png)
![new address form](https://user-images.githubusercontent.com/957520/59891956-d8068d00-939c-11e9-8e6a-ae079f7afa1a.png)
![checkout address options](https://user-images.githubusercontent.com/957520/59892001-fbc9d300-939c-11e9-8571-d18a32a06868.png)
![checkout address options](https://user-images.githubusercontent.com/957520/59892002-fbc9d300-939c-11e9-8873-b898743b329a.png)
![checkout address options](https://user-images.githubusercontent.com/957520/59892003-fbc9d300-939c-11e9-9101-277b460c3375.png)
![checkout address options](https://user-images.githubusercontent.com/957520/59892004-fbc9d300-939c-11e9-88b3-f5a1efecdad0.png)

## Testing

Run the following to automatically build a dummy app and run the tests:

```console
$ bundle exec rake
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jtapia/solidus_address_book.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
