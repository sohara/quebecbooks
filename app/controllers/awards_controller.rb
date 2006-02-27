class AwardsController < ApplicationController
  def index
  end
  
  def year
    @awards =  Award.find(:all, :conditions => ["year =?", @params[:year]])
  end
  
end
