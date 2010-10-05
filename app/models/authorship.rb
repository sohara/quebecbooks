# == Schema Information
#
# Table name: authorships
#
#  author_id :integer(2)
#  book_id   :integer(2)
#  id        :integer(4)      not null, primary key
#  kind      :string(255)     default("Author"), not null
#

class Authorship < ActiveRecord::Base
  belongs_to :author
  belongs_to :book
  
  KINDS = [ 
  # Displayed, stored in db 
  [ "Author", "Author" ],
  [ "Translator", "Translator" ]
  ]
  
end
