# The filters added to this controller will be run for all controllers in the application.
# Likewise will all the methods added be available for all controllers.
class ApplicationController < ActionController::Base
  # before_filter :set_charset

  # def set_charset
  #  @headers["Content-Type"] = "text/html; charset=ISO-8859-1"
  # end

  
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
  
  def paginate_collection(collection, options = {})
     default_options = {:per_page => 10, :page => 1}
     options = default_options.merge options

     pages = Paginator.new self, collection.size, options[:per_page], options[:page]
     first = pages.current.offset
     last = [first + options[:per_page], collection.size].min
     slice = collection[first...last]
     return [pages, slice]
   end

end