# Tencent::Weibo

A simple Ruby interface to the Tencent Weibo API. Currently only implemented Authorization Code strategy for Tencent's OAuth 2.0.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tencent-weibo'
```

Unless oauth2 accept [this pull request](https://github.com/intridea/oauth2/pull/130), you also need my fork of oauth2:

```ruby
gem 'oauth2', git: 'git://github.com/rainux/oauth2'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tencent-weibo


## Usage

```ruby
client = Tencent::Weibo::Client.new('APP_KEY', 'APP_SECRET', 'REDIRECT_URI')
client.auth_code.authorize_url
# Visit the url to login with your Tencent account and be redirect back to the REDIRECT_URI.
access_token = client.auth_code.get_token(params[:code])
access_token.get('api/user/info').parsed
# => User info hash for current logged in Tencent account.
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
