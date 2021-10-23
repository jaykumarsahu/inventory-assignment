class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email, null: false, index: { unique: true }
      t.integer :role_type, default: 0
      t.references :company
      t.timestamps
    end
  end
end
