class CreateEmailers < ActiveRecord::Migration
  def self.up
    create_table :emailers do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :emailers
  end
end
