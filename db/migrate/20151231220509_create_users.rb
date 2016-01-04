class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :password_digest
      t.string :username
      t.integer :price
      t.string :type
      t.string :address
      t.text :description

      t.timestamps null: false
    end
  end
end
