class Inventory < ApplicationRecord
  has_many :products
  belongs_to :company
end
