class MigratImageToPaperclip < ActiveRecord::Migration
  require 'content_type'
  def self.up
    Image.all.each do |i|
      unless i.old_file_name.blank?
        puts "In old_file_name.blank? conditional"
        puts "Old file name: #{i.old_file_name}"
        #File.open(Rails.root.join("public","image","name",i.id.to_s,i.old_file_name)) { |file| i.image = file }
        if i.update_attributes!(
          :image_file_name => i.old_file_name,
          :image_content_type => content_type(File.new(Rails.root.join("public","image","name",i.id.to_s,i.old_file_name))),
          :image_updated_at => Time.now.utc,
          :image_file_size => File.stat(Rails.root.join("public","image","name",i.id.to_s,i.old_file_name)).size)
          puts "attributes updated"
        else
          puts "unable to update attributes"
        end
      end
    end
  end

  def self.down
  end
end
