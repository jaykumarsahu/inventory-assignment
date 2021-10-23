class Company < ApplicationRecord
  has_many :inventories
  has_many :products, through: :inventories
  has_many :users
end
