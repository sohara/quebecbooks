class AddAttachmentsToImages < ActiveRecord::Migration
  def self.up
    add_column :images, :image_file_name, :string
    add_column :images, :image_content_type, :string
    add_column :images, :image_file_size, :integer
    add_column :images, :image_updated_at, :datetime
    rename_column "images", "name", "old_file_name"
  end

  def self.down
    remove_column :images, :image_file_name
    remove_column :images, :image_content_type
    remove_column :images, :image_file_size
    remove_column :images, :image_updated_at
    rename_column "images", "old_file_name", "name"
  end
end
