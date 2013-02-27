module Tencent
  module Weibo
    class AccessToken < OAuth2::AccessToken
      def request(verb, path, opts = {}, &block)
        opts[:params] ||= {}
        opts[:params] = {
          format: :json,
          oauth_consumer_key: @client.app_key,
          access_token: @token,
          openid: @params['openid'] || @params[:openid],
          oauth_version: '2.a'
        }.merge(opts[:params])
        opts[:parse] = :json
        super
      end
    end
  end
end
