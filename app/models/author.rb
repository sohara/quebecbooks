# == Schema Information
#
# Table name: authors
#
#  id          :integer(2)      not null, primary key
#  first_name  :string(255)
#  last_name   :string(255)
#  other_name  :string(255)
#  language    :string(255)
#  nationality :string(255)
#  born_on     :date
#  birthplace  :string(255)
#  died_on     :date
#  sex         :string(10)
#  web_site    :string(255)
#  biography   :text
#  note        :text
#  created_on  :timestamp       not null
#  updated_on  :timestamp       not null
#

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
                
  cattr_reader :per_page
  @@per_page = 20
  
end
