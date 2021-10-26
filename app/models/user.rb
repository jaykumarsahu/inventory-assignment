class User < ApplicationRecord
  devise :database_authenticatable
  belongs_to :company

  enum role_type: %i[not_assigned quality_checker inventory_manager sales_manager it_admin admin]

  validates_confirmation_of :password
  validates :password_confirmation, presence: true, on: :create
  validates :password, presence: true, on: :create
  validates :email, presence: true, uniqueness: true
end
