if Rails.env.development?
  admin = AdminUser.find_or_create_by(email: 'admin@example.com')
  admin.password = 'password'
  admin.password_confirmation = 'password'
  admin.save!(validate: false)
end

company = Company.find_or_create_by(name: 'Test-company')
inventory = company.inventories.find_or_create_by(name: 'Test-inventory')

10.times { |index| inventory.products.find_or_create_by(name: "Test-product-#{index + 1}") }

%i[inventory_manager quality_checker sales_manager it_admin admin].each do |role_type|
  user = company.users.find_or_create_by(email: "#{role_type}@test.com", role_type: role_type)
  user.password = 'password'
  user.password_confirmation = 'password'
  user.save!(validate: false)
end
