require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Popugi < OmniAuth::Strategies::OAuth2
      option :name, 'popugi'


      option :client_options, {
          :site => "http://auth:3000/",
          :authorize_url => "http://auth:3000/oauth/authorize"
      }

      uid { raw_info["public_id"] }

      info do
        {
            :email => raw_info["email"],
            :full_name => raw_info["full_name"],
            :position => raw_info["position"],
            :active => raw_info["active"],
            :role => raw_info["role"],
            :public_id => raw_info["public_id"]
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/accounts/current').parsed
      end
    end
  end
end
