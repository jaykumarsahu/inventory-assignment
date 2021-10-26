module Api
  class BaseController < ApplicationController
    before_action :authenticate_request!, :set_company

    private

    def set_company
      return unless current_user

      @company = current_user.company
    end
  end
end
