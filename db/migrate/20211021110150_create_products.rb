class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.references :inventory
      t.integer :testing_status, default: 0
      t.timestamps
    end
  end
end
