# Model to hold images that belong to author or book objects.
# The image name attribut (it's filename) is a FileColumn object.
# The FileColumn plugin (located in vendor/plugins) provides 
# file upload and image manipulation methods using RMagick
# See http://www.kanthak.net/opensource/file_column/ for info.
class Image < ActiveRecord::Base
  belongs_to :books
  belongs_to :authors
  file_column :name
  
  file_column :name, :magick => { :versions => { 
                :thumb96 => {:size => "96x150>"}, 
                :medium250 => {:size => "250x400>"},
                :large480 => {:size => "480X640>"},
              }
            }  
            
            
            #    file_column :image, :magick => {:versions => {
            #         :square => {:crop => "1:1", :size => "50x50", :name => "thumb"},
            #         :screen => {:crop => "4:3", :size => "640x480>"},
            #         :widescreen => {:crop => "16:9", :size => "640x360!"},
            #       }
            #    }         
end
