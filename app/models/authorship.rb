class Authorship < ActiveRecord::Base
  belongs_to :author
  belongs_to :book
  
  KINDS = [ 
  # Displayed, stored in db 
  [ "Author", "Author" ],
  [ "Translator", "Translator" ]
  ]
  
end
