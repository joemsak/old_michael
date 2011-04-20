class AddOrderToPrices < ActiveRecord::Migration
  def self.up
    add_column :prices, :order, :integer
  end

  def self.down
    remove_column :prices, :order
  end
end
