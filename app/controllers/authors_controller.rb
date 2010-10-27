class AuthorsController < ApplicationController
  def index
    @authors = Author.paginate :page => params[:page], :order => 'last_name',  :include => [:images]
  end
  
  def view
    @author = Author.find(params[:id])
    @authors= Author.find(:all, :order => "last_name")
    @author_current = @authors.index(@authors.find{|h| h.id == @author.id })
    @author_next = @authors[@author_current+1]
    @author_previous = @authors[@author_current-1]
    @author_number = @author_current+1
  end

  def search
    begin
      @authors = Author.find( :all, :conditions => ["CAST(CONCAT(REPLACE(first_name, ' ', ''),REPLACE(other_name, ' ', ''),REPLACE(last_name, ' ', '')) AS CHAR) LIKE ?", '%' + params[:author][:name].downcase.gsub(' ','') + '%'])
    rescue ActiveRecord::RecordNotFound
      logger.info "record not found"
    else  
      if @authors.size == 1
        redirect_to :action => 'view', :id => @authors[0] 
      elsif @authors.size > 1
          @author_pages, @authors = paginate :author, {
          :per_page => 20,
          :conditions => ["CAST(CONCAT(first_name,' ',other_name,' ',last_name) AS CHAR) LIKE ?", '%' + params[:author][:name].downcase + '%'],
          :order_by => 'last_name'
        }
      
        flash[:notice] = 'Your seach results'
        render_action 'list'
      else
        flash[:notice] = 'Your search returned nothing'
        redirect_to :action => 'index'
      end  
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
     
end
