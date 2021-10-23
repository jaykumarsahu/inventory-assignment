if Rails.env.development?
  admin = AdminUser.find_or_create_by(email: 'admin@example.com')
  admin.password = 'password'
  admin.password_confirmation = 'password'
  admin.save!(validate: false)
end

company = Company.find_or_create_by(name: 'Test-company')
inventory = company.inventories.find_or_create_by(name: 'Test-inventory')
inventory.products.find_or_create_by(name: 'Test-product')
company.users.find_or_create_by(email: 'company_admin@test.com', role_type: :admin)
