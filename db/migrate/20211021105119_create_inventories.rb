class CreateInventories < ActiveRecord::Migration[6.1]
  def change
    create_table :inventories do |t|
      t.string :name, null: false
      t.references :company

      t.timestamps
    end
  end
end
