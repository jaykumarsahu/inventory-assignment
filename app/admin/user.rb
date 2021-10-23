ActiveAdmin.register User do
  permit_params :name, :company_id, :role_type
end
