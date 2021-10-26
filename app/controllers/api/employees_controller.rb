module Api
  class EmployeesController < Api::BaseController
    before_action :set_employee, only: %i[show update destroy]

    def index
      render json: { employees: @company.users }
    end

    def show
      render json: { employee: @record }
    end

    def create
      @record = @company.users.new(employee_params)
      @record.password = params[:employee][:password]
      @record.password_confirmation = params[:employee][:password_confirmation]

      if @record.save
        render json: { employee: @record }
      else
        render json: { errors: @record.errors }
      end
    end

    def update
      if @record.update(employee_params)
        render json: { employee: @record }
      else
        render json: { errors: @record.errors }
      end
    end

    def destroy
      @record.destroy
      render json: { notice: 'Employee was successfully destroyed.' }
    end

    private

    def set_employee
      @record = @company.users.find(params[:id])
    end

    def employee_params
      params.require(:employee).permit(:role_type, :email)
    end
  end
end
