# Class defines the Name object, aggregation of attirbutes of Author 
# object. 
class Name
  attr_reader :first, :other, :last
  
  def initialize(first, other, last)
    @first = first
    @other = other
    @last = last
  end
  
  def to_s
    [ @first, @other, @last ].compact.join(" ")
  end
end
