class Admin::AuthorsController < AdminAreaController

  def auto_complete_for_author_name
    @authors = Author.find(:all, 
      :conditions => [ "CAST(CONCAT(first_name,' ',other_name,' ',last_name) AS CHAR) LIKE ?",
      '%' + params[:author][:name].downcase + '%' ], 
      :order => 'last_name ASC',
      :limit => 8)
    render :partial => 'names'
  end
    
  def index
    list
    render :action => 'list'
  end

  def list
    @author_pages, @authors = paginate :author, :per_page => 20, :order_by => 'last_name'
  end

  def show
    @author = Author.find(params[:id])
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(params[:author])
    @author.images << Image.new(:name => params[:image][:name],
                              :caption => params[:image][:caption]) if params[:image][:name].size > 1000
    if @author.save
      flash[:notice] = 'Author was successfully created.'
      redirect_to :action => 'show', :id => @author
    else
      render :action => 'new'
    end
  end


  def search
    @authors = Author.find( :all, :conditions => ["CAST(CONCAT(REPLACE(first_name, ' ', ''),REPLACE(other_name, ' ', ''),REPLACE(last_name, ' ', '')) AS CHAR) LIKE ?", '%' + params[:author][:name].downcase.gsub(' ','') + '%'])
    if @authors.nitems == 1
      redirect_to :action => 'edit', :id => @authors[0] 
    elsif @authors.nitems > 1
      flash[:notice] = 'Your seach results'
      render_action 'list'
    else
      flash[:notice] = 'Your search returned nothing'
      redirect_to :action => 'index'
    end  
  end

  def edit
    if params[:id]
      @author = Author.find(params[:id])
    else
      @author = Author.find( :first, :conditions => ["CAST(CONCAT(first_name,' ',other_name,' ',last_name) AS CHAR) = ?", params[:author][:name]])
    end  
  end

  def update
    @author = Author.find(params[:id])
    
    #Append new image to author if it was actually uploaded (checked via size)
    @author.images << Image.new(:name => params[:image][:name],
                              :caption => params[:image][:caption]) if params[:image][:name].size > 1000
   
    # iterate over checkboxed images to delete them if checked
    params[:delete_image].each { |image| Image.find(image[0]).destroy if image[1] == '1'} if params[:delete_image]
    
    if @author.update_attributes(params[:author])
      flash[:notice] = 'Author was successfully updated.'
      redirect_to :action => 'show', :id => @author
    else
      render :action => 'edit'
    end
  end

  def destroy
    Author.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
