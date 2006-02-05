# Model to hold images that belong to author or book objects.
# The image name attribut (it's filename) is a FileColumn object.
# The FileColumn plugin (located in vendor/plugins) provides 
# file upload and image manipulation methods using RMagick
# See http://www.kanthak.net/opensource/file_column/ for info.
class Image < ActiveRecord::Base
  belongs_to :books
  belongs_to :authors
  file_column :name
  
  file_column :name, :magick => { 
            :quality => '10',
            :versions => { "thumb96" => "96x150>", "medium250" => "250x400>", "large480" => "480X640>" }
          }
end
