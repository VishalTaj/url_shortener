module Api::Concerns::Authenticator
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_api

    def authenticate_api
      if request.format.json?
        decoded_token = JsonWebToken.decode(http_auth_header) || {}
        @authorize_token = AuthorizeToken.find(decoded_token["id"])
        unless @authorize_token && ActiveSupport::SecurityUtils.secure_compare(@authorize_token.token, http_auth_header)
          render json: { error: "Sorry you don't have access" }, status: 401
        end
      elsif request.format.any?
        true
      end
    end
  end

  def http_auth_header
    if request.headers['Authorization'].present?
      return request.headers['Authorization'].split(' ').last
    end
  end
end
  