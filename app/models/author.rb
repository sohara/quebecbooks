class Author < ActiveRecord::Base
  
  has_many :authorships
  has_many :books, :through => :authorships
  has_many :translations, :through => :authorships, :source => :book, :conditions => "authorships.kind='Translator'"
  has_many :writings, :through => :authorships, :source => :book, :conditions => "authorships.kind='Author'"
  has_many :images
  validates_presence_of :first_name, :last_name
  
  # composed_of declaration maps Author attributes to the Name model object
  composed_of :name,
              :class_name => "Name",
              :mapping => 
                [ [ :first_name, :first ],
                  [ :other_name, :other],
                  [ :last_name, :last]
                ]
end