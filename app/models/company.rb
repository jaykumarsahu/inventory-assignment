class Company < ApplicationRecord
  has_many :inventories
  has_many :users
end
