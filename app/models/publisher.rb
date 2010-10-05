# == Schema Information
#
# Table name: publishers
#
#  id             :integer(2)      not null, primary key
#  publisher_name :string(255)
#  publisher_code :string(255)
#  web_site       :string(255)
#  note           :text
#

class Publisher < ActiveRecord::Base
    has_and_belongs_to_many :books
    validates_presence_of :publisher_name
    
    def publisher_name_truncated
      publisher_name[0,30]
    end
end
