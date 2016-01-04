class RemovePriceFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :type
    remove_column :users, :price
  end
end
