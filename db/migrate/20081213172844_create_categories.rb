class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
	  t.string :title
      t.integer :category_order
      
      #attachment_fu is up in this
      t.integer :parent_id
      t.string :content_type
      t.string :filename
      t.string :thumbnail
      t.integer :size
      t.integer :width
      t.integer :height
      
      t.timestamps
    end
  end

  def self.down
    drop_table :categories
  end
end
