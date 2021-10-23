class Product < ApplicationRecord
  belongs_to :inventory
  enum testing_status: %i[not_tested approved rejected]
end
