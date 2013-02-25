module Tencent
  module Weibo
    module Strategy
      class AuthCode < OAuth2::Strategy::AuthCode
        def authorize_url(params = {})
          params = add_addtional_params(params)
          super
        end

        def get_token(code, params = {}, opts = {})
          params = add_addtional_params(params)
          super
        end

        private

        def add_addtional_params(params)
          {:redirect_uri => @client.redirect_uri}.merge(params)
        end
      end
    end
  end
end
