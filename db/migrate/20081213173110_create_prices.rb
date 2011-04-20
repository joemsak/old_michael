class CreatePrices < ActiveRecord::Migration
  def self.up
    create_table :prices do |t|
		t.string :name
		t.integer :price
		
        t.timestamps
    end
  end

  def self.down
    drop_table :prices
  end
end