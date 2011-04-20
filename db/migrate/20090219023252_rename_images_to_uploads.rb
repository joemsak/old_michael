class RenameImagesToUploads < ActiveRecord::Migration
  def self.up
  	rename_table(:images, :uploads)
  end

  def self.down
  	rename_table(:uploads, :images)
  end
end
