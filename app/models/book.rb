class Book < ActiveRecord::Base
    has_and_belongs_to_many :authors
    has_and_belongs_to_many :publishers 
    has_many :images
    has_many :awards
    validates_presence_of :title
    validates_uniqueness_of :title
    validates_associated :awards
end
