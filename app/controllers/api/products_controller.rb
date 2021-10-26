module Api
  class ProductsController < Api::BaseController
    before_action :authorized?
    before_action :set_product, only: %i[show update destroy update_status]

    def index
      render json: { products: @company.products }
    end

    def show
      render json: { product: @record }
    end

    def create
      @record = @company.products.new(product_params)

      if @record.save
        render json: { product: @record }
      else
        render json: { errors: @record.errors }
      end
    end

    def update_status
      case params[:status]
      when 'approved' then @record.approved!
      when 'rejected' then @record.rejected!
      else
        render json: { error: 'Incorrect status.' }, status: :unprocessable_entity and return
      end

      render json: { product: @record }
    end

    def update
      render json: { product: @record } if @record.update(product_params)
    end

    def destroy
      @record.destroy
      render json: { notice: 'Product was successfully destroyed.' }
    end

    private

    def set_product
      @record = @company.products.find(params[:id])

      render json: { error: 'Product not found.' }, status: :not_found unless @record
    end

    def product_params
      params.require(:product).permit(:name)
    end
  end
end
