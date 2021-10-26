class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  protected

  # Validates the token and user and sets the @current_user scope
  def authenticate_request!
    return invalid_authentication if !payload || !AuthToken.valid?(payload)

    invalid_authentication unless current_user
  end

  # Returns 401 response. To handle malformed / invalid requests.
  def invalid_authentication
    render json: { error: I18n.t('devise.failure.invalid') }, status: :unauthorized
  end

  private

  # Deconstructs the Authorization header and decodes the JWT token.
  def payload
    token = request.headers['Authorization'].split(' ').last
    AuthToken.decode(token).first
  rescue StandardError
    nil
  end

  # Sets the @current_user with the user_id from payload
  def current_user
    return unless payload

    @current_user ||= User.find_by(id: payload['id'])
  end
end
