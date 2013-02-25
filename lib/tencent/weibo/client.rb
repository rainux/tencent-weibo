module Tencent
  module Weibo
    class Client < OAuth2::Client
      attr_reader :app_key, :redirect_uri

      def initialize(app_key, app_secret, redirect_uri, opts = {}, &block)
        @app_key = app_key
        @app_secret = app_secret
        @redirect_uri = redirect_uri
        opts = {
          site: 'https://open.t.qq.com',
          authorize_url: '/cgi-bin/oauth2/authorize',
          token_url: '/cgi-bin/oauth2/access_token'
        }.merge(opts)
        super(app_key, app_secret, opts, &block)
      end

      def get_token(params, access_token_opts = {}, access_token_class = AccessToken)
        super
      end

      # The Authorization Code strategy
      #
      # @see http://tools.ietf.org/html/draft-ietf-oauth-v2-15#section-4.1
      def auth_code
        @auth_code ||= Tencent::Weibo::Strategy::AuthCode.new(self)
      end

      # The Implicit strategy
      #
      # @see http://tools.ietf.org/html/draft-ietf-oauth-v2-26#section-4.2
      def implicit
        @implicit ||= Tencent::Weibo::Strategy::Implicit.new(self)
      end
    end
  end
end
