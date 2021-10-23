class User < ApplicationRecord
  devise :database_authenticatable
  belongs_to :company

  enum role_type: %i[not_assigned quality_checker inventory_manager sales_manager it_admin admin]
end
