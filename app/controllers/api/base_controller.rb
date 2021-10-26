module Api
  class BaseController < ApplicationController
    before_action :authenticate_request!
    before_action :authorize_user!
    before_action :set_company

    private

    def set_company
      return unless current_user

      @company = current_user.company
    end

    def authorize_user!
      service = PermissionService.new(current_user)
      resource = params[:controller].split('/').last.classify
      return if service.has_permission?(resource, params[:action])

      render json: { error: 'User is not permitted to perform the operation.' }, status: :unauthorized and return
    end
  end
end
