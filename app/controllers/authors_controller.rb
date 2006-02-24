class AuthorsController < ApplicationController
  def index
    list
    render :action => 'list'
  end

  def list
    @author_pages, @authors = paginate :author, :per_page => 20, :order_by => 'last_name'
  end
  
  def view
    @author = Author.find(params[:id])
    @authors= Author.find(:all, :order => "last_name")
    @author_current = @authors.index(@authors.find{|h| h.id == @author.id })
    @author_next = @author[@author_current+1]
    @author_previous = @author[@author_current-1]
  end

  def search
    @authors = Author.find( :all, :conditions => ["CAST(CONCAT(first_name,' ',other_name,' ',last_name) AS CHAR) LIKE ?", '%' + @params[:author][:name].downcase + '%'])
    if @authors.nitems == 1
      redirect_to :action => 'view', :id => @authors[0] 
    elsif @authors.nitems > 1
      flash[:notice] = 'Your seach results'
      render_action 'list'
    else
      flash[:notice] = 'Your search returned nothing'
      redirect_to :action => 'index'
    end  
  end
   
end
