class Book < ActiveRecord::Base
    has_many :authorships
    has_many :authors, :through => :authorships
    has_many :translators, :through => :authorships, :source => :author, :conditions => "authorships.kind='Translator'"
    has_many :writers, :through => :authorships, :source => :author, :conditions => "authorships.kind='Author'"
    has_and_belongs_to_many :publishers 
    has_many :images
    has_many :awards
    validates_presence_of :title
    validates_uniqueness_of :title
    validates_presence_of :category
    validates_associated :awards
end
