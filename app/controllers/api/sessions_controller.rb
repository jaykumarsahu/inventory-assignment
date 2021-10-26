module Api
  class SessionsController < Api::BaseController
    skip_before_action :authenticate_request!, :authorize_user!

    def create
      user = User.find_by(email: params[:email].to_s.downcase)
      if user&.valid_password?(params[:password])
        auth_token = AuthToken.encode({ id: user.id })
        render json: { auth_token: auth_token }, status: :ok
      else
        render json: { error: I18n.t('devise.failure.invalid', authentication_keys: :email) },
               status: :unprocessable_entity
      end
    end
  end
end
