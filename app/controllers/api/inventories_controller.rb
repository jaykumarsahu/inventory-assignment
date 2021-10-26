module Api
  class InventoriesController < Api::BaseController
    before_action :set_inventory, only: %i[show update destroy]

    def index
      render json: { inventories: @company.inventories }
    end

    def show
      render json: { inventory: @record }
    end

    def create
      @record = @company.inventories.new(inventory_params)

      if @record.save
        render json: { inventory: @record }
      else
        render :new
      end
    end

    def update
      if @record.update(inventory_params)
        render json: { inventory: @record }
      else
        render :edit
      end
    end

    def destroy
      @record.destroy
      render json: { notice: 'Inventory was successfully destroyed.' }
    end

    private

    def set_inventory
      @record = @company.inventories.find(params[:id])
    end

    def inventory_params
      params.fetch(:inventory, {})
    end
  end
end
