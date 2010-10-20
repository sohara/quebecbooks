# == Schema Information
#
# Table name: images
#
#  id         :integer(2)      not null, primary key
#  author_id  :integer(2)
#  book_id    :integer(2)
#  name       :string(100)
#  caption    :string(255)
#  created_at :timestamp       not null
#

# Model to hold images that belong to author or book objects.
# The image name attribut (it's filename) is a FileColumn object.
# The FileColumn plugin (located in vendor/plugins) provides 
# file upload and image manipulation methods using RMagick
# See http://www.kanthak.net/opensource/file_column/ for info.
class Image < ActiveRecord::Base
  belongs_to :books
  belongs_to :authors
  
  has_attached_file :image,
    :url => "/image/name/:id/:style/:basename.:extension",
    :path => ":rails_root/public/image/name/:id/:style/:basename.:extension",
    :styles => {:thumb96 => "96x150>",
                :medium250 => "250x400>",
                :large480 => "480X640>"}


  # file_column :name, :magick => { :versions => { 
  #               :thumb96 => {:size => "96x150>"}, 
  #               :medium250 => {:size => "250x400>"},
  #               :large480 => {:size => "480X640>"},
  #             }
  #           }  

end
