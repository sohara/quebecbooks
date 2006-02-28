class AwardsController < ApplicationController
  def index
  end
  
  def year
    @awards =  Award.find(:all, :conditions => ["year =?", @params[:year]])
  end
  
  def category
    @awards = Award.find(:all, :conditions => ["category =?", @params[:category]], :order => "year DESC")
  end
  
end
