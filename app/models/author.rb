class Author < ActiveRecord::Base
  
  has_and_belongs_to_many :books
  has_many :images
  validates_presence_of :first_name, :last_name
  
  # composed_of declaration maps Author attributes to the Name model object
  composed_of :name,
              :class_name => Name,
              :mapping => 
                [ [ :first_name, :first ],
                  [ :other_name, :other],
                  [ :last_name, :last]
                ]
end
