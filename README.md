## Mailchimp API v3

[![](http://img.shields.io/gem/v/mailchimp_api_v3.svg?style=flat)](https://rubygems.org/gems/mailchimp_api_v3)
[![](https://img.shields.io/circleci/project/Xenapto/mailchimp_api_v3/develop.svg)](https://circleci.com/gh/Xenapto/mailchimp_api_v3)
[![](http://img.shields.io/codeclimate/github/Xenapto/mailchimp_api_v3.svg?style=flat)](https://codeclimate.com/github/Xenapto/mailchimp_api_v3)
[![](https://img.shields.io/coveralls/Xenapto/mailchimp_api_v3/develop.svg?style=flat)](https://coveralls.io/r/Xenapto/mailchimp_api_v3?branch=develop)
[![](http://img.shields.io/badge/developer-awesome-brightgreen.svg?style=flat)](http://xenapto.com)

A simple gem to interact with Mailchimp through their API v3

### Project status

This gem currently does everything I need for my project but it is far from complete. I will willingly accept good quality pull requests to complete the feature set.

My own requirements are for subscription management for my mailing list, so the gem can add and remove members from a list and manage their interests.

### Installation

Add this line to your application's Gemfile:

    gem 'mailchimp_api_v3'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mailchimp_api_v3

### Usage

The Mailchimp API documentation is here: http://kb.mailchimp.com/api. Their suggstions for subscriber management are here: http://kb.mailchimp.com/api/article/how-to-manage-subscribers.

To connect to the Mailchimp API you need to supply an API key. You can do this explicitly when you connect, or you can set an environment variable `MAILCHIMP_API_KEY`.

Examples:

```ruby
MailchimpAPIV3.connect(my_api_key) # Uses the API key in my_api_key
MailchimpAPIV3.connect # Uses ENV['MAILCHIMP_API_KEY']
```

```ruby
MailchimpAPIV3.connect.lists
```

```ruby
mailchimp = MailchimpAPIV3.connect
list = mailchimp.lists.find_by name: 'My first list'
```

```ruby
mailchimp = MailchimpAPIV3.connect
member = mailchimp.lists('e73f5910ca').members('ann@example.com')
member.name # => "Ann Example"
```

### Contributing

1.  Fork it
1.  Create your feature branch (`git checkout -b my-new-feature`)
1.  Commit your changes (`git commit -am 'Add some feature'`)
1.  Push to the branch (`git push origin my-new-feature`)
1.  Create new Pull Request

### Testing

The tests use Rspec and VCR. To avoid including my test API key in the VCR cassettes the tests use Erb to insert an api key at runtime. Whatever API key is available will allow the tests to pass.

If you need to add more cassettes you can use your own test API key then edit the VCR cassette in the same way before you issue the pull request.

### Acknowledgements

I used the sample code in https://github.com/mailchimp/APIv3-examples as my starting point for this gem. Thanks to
the Mailchimp developers for the head start.
