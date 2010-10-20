# == Schema Information
#
# Table name: books
#
#  id                   :integer(2)      not null, primary key
#  language             :string(255)
#  title                :string(255)
#  subtitle             :string(255)
#  category             :string(12)
#  topic                :string(255)
#  copyright_year       :integer(2)
#  isbn_number          :string(255)
#  place_of_publication :string(255)
#  date_published       :integer(2)
#  edition_number       :integer(1)
#  cover_type           :string(12)
#  page_count           :integer(2)
#  shelf_number         :integer(2)
#  abstract             :text
#  extract              :text
#  created_on           :timestamp       not null
#  updated_on           :timestamp       not null
#

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
    
    attr_accessible :language, :title, :category, :topic, :copyright_year, :isbn_number, :place_of_publication, :date_published, :edition_number, :cover_type, :page_count, :shelf_number, :abstract, :extract
    
    cattr_reader :per_page
    @@per_page = 20
end
