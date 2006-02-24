# The filters added to this controller will be run for all controllers in the application.
# Likewise will all the methods added be available for all controllers.
class ApplicationController < ActionController::Base

  def authorize
    unless session[:user_id]
      flash[:notice] = "Please log in"
      redirect_to(:controller => "login", :action => "login")
    end
  end
  
  def auto_complete_for_author_name
    @authors = Author.find(:all, 
      :conditions => [ "CAST(CONCAT(first_name,' ',other_name,' ',last_name) AS CHAR) LIKE ?",
      '%' + params[:author][:name].downcase + '%' ], 
      :order => 'last_name ASC',
      :limit => 8)
    render :partial => 'names'
  end
  
  auto_complete_for :book, :title

end