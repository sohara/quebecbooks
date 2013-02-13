# encoding: utf-8

# == Schema Information
#
# Table name: awards
#
#  id       :integer(2)      not null, primary key
#  book_id  :integer(4)      default(0), not null
#  category :string(255)     default(""), not null
#  year     :integer(4)      default(0), not null
#  status   :string(255)     default(""), not null
#

# encoding: utf-8
class Award < ActiveRecord::Base
  belongs_to :book
  validates_presence_of :category, :year, :status
  validates_inclusion_of :category,
                         :in => [ "Fiction", "Non-Fiction", "Poetry", "First-Book", "Translation", "Children’s & Y.A. Lit." ],
                         :message => "should be either 'Fiction', 'Non-Fiction' 'Poetry', 'First-Book', or  'Translation'"
  validates_inclusion_of :status,
                         :in => %w{ Finalist Winner },
                         :message => "should be either 'Finalist' or 'Winner'"

# This method maps award names to awards base on their category and year
   def name
     if self[:category] == 'Fiction'
       if self[:year] > 2005
         'The Paragraphe Hugh MacLennan Prize for Fiction'
       elsif self[:year] > 1990
         'The Hugh MacLennan Prize for Fiction'
       else
         'The QSPELL Prize for Fiction'
       end
     elsif self[:category] == 'Non-Fiction'
       if self[:year] > 1997
         'The Mavis Gallant Prize for Non-Fiction'
       else
         'The QSPELL Prize for Non-Fiction'
       end
     elsif self[:category] == 'Poetry'
       if self[:year] > 1991
         'The A.M. Klein Prize for Poetry'
       else
         'The QSPELL Prize for Poetry'
       end
      elsif self[:category] == 'First-Book'
        if self[:year] > 2010
          'Concordia University First Book Prize'
        elsif self[:year] == 2010
          'QWF First Book Prize'
        elsif self[:year] > 2001
          'McAuslan First Book Prize'
        else
          'First Book Prize'
        end
      elsif self[:category] == "Children’s & Y.A. Lit."
        "The QWF Prize for Children’s and Young Adult Literature"
      else
        'QWF Translation Prize'
      end

   end

end
