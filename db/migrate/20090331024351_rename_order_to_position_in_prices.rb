class RenameOrderToPositionInPrices < ActiveRecord::Migration
  def self.up
  	rename_column "prices", "order", "position" 
  end

  def self.down
  	rename_column "prices", "position", "order"
  end
end
