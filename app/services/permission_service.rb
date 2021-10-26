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

  def check_product_permissions(action)
    case action
    when 'update_status' then @user.quality_checker?
    end
  end

  def check_employee_permissions(action)
    case action
    when 'create', 'update', 'destroy' then @user.it_admin?
    end
  end

  def check_inventory_permissions(action)
    case action
    when '' then ''
    end
  end
end
