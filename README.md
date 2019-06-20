# SolidusAddressBook

[![Build Status](https://travis-ci.org/jtapia/solidus_address_book.svg?branch=master)](https://travis-ci.org/jtapia/solidus_address_book)

This extension allows registered users to have multiple shipping & billing addresses and select each of them on checkout.

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

![account index](https://www.dropbox.com/s/n62vq7jy2lrwfeb/account-index.png?dl=0)
![checkout user addresses](https://www.dropbox.com/s/4b8m1mdwajsn61t/checkout%20user%20addresses.png?dl=0)
![edit address form](https://www.dropbox.com/s/csrhkn8scv87fmd/edit%20address%20form.png?dl=0)
![new address form](https://www.dropbox.com/s/mqa81r5a4u7ghg9/new%20address%20form.png?dl=0)
![checkout options](https://www.dropbox.com/s/m758ua2g6k9rmz0/1.png?dl=0)
![checkout options](https://www.dropbox.com/s/t6s3ezsxen9izcn/2.png?dl=0)
![checkout options](https://www.dropbox.com/s/ux0bcq8w4b2v1cc/3.png?dl=0)
![checkout options](https://www.dropbox.com/s/2nid5ah14mr5y9u/4.png?dl=0)

## Testing

Run the following to automatically build a dummy app and run the tests:

```console
$ bundle exec rake
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jtapia/solidus_address_book.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
