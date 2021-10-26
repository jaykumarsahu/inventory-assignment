class PermissionService
  def initialize(user)
    @user = user
  end

  def has_permission?(resource, action)
    return true if @user.admin?

    case resource
    when 'Product' then check_product_permissions(action)
    when 'Employee' then check_employee_permissions(action)
    when 'Inventory' then check_inventory_permissions(action)
    end
  end

  private

  def check_product_permissions(action)
    case action
    when 'index', 'show'
      @user.quality_checker? || @user.inventory_manager? || @user.sales_manager?
    when 'create', 'update', 'destroy'
      @user.inventory_manager?
    when 'update_status'
      @user.quality_checker?
    end
  end

  def check_employee_permissions(action)
    case action
    when 'index', 'show'
      @user.it_admin? || @user.sales_manager?
    when 'create', 'update', 'destroy' then @user.it_admin?
    end
  end

  def check_inventory_permissions(action)
    case action
    when 'index', 'show', 'create', 'update', 'destroy'
      @user.inventory_manager?
    end
  end
end
