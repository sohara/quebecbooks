class Admin::BooksController < AdminAreaController
  
  auto_complete_for :book, :title
  
  def index
    list
    render :action => 'list'
  end

  def list
    @book_pages, @books = paginate :book, :per_page => 20, :order_by => 'title'
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
    @authors = Author.find( :all, :order => 'last_name')
    @publishers = Publisher.find( :all, :order => 'publisher_name')
  end

  def create
    @authors = Author.find( :all, :order => 'last_name')
    @book = Book.new(params[:book])
    @book.authors = Author.find(params[:author_ids]) if params[:author_ids]
    @book.images << Image.new(:name => params[:image][:name],
                              :caption => params[:image][:caption]) if params[:image][:name].size > 1000;
    if @book.save
      flash[:notice] = 'Book was successfully created.'
      @book.publishers << Publisher.find(params[:publisher_ids]) if params[:publisher_ids]
      redirect_to :action => 'show', :id => @book
    else
      render :action => 'new'
    end
  end
  
  def search
    @books = Book.find( :all, :conditions => ["LOWER(title) LIKE ?", '%' + params[:book][:title].downcase + '%' ])
    if @books.nitems == 1
      redirect_to :action => 'edit', :id => @books[0]
    elsif @books.nitems > 1
      flash[:notice] = 'Your seach results'
      render_action 'list'
    else
      flash[:notice] = 'Your search returned nothing'
      redirect_to :action => 'index'
    end  
  end

  def edit
    if params[:id]
      @book = Book.find(params[:id]) 
    else
      @book = Book.find( :first, :conditions => ["title = ?", params[:book][:title]])
    end  
    @authors = Author.find( :all, :order => 'last_name')
    @publishers = Publisher.find( :all, :order => 'publisher_name')
  end
  
  def update
    @book = Book.find(params[:id])
    @authors = Author.find( :all, :order => 'last_name')
    @publishers = Publisher.find( :all, :order => 'publisher_name')
    #@book.authors = Author.find(params[:author_ids]) if params[:author_ids]
    @book.publishers = Publisher.find(params[:publisher_ids]) if params[:publisher_ids]
    
    #Append new image to book if it was actually uploaded (checked via size)
    @book.images << Image.new(:name => params[:image][:name],
                              :caption => params[:image][:caption]) if params[:image][:name].size > 1000
                              
    # iterate over checkboxed images to delete them if checked
    params[:delete_image].each { |image| 
      Image.find(image[0]).destroy if image[1] == '1'} if params[:delete_image]
    
    # Update any changes to existing awards
    @book.awards.collect{ |award| 
      award.update_attributes( params[:award][ award.id.to_s ] )
      }
      
   # iterate over checkboxed awards to delete them if checked
      params[:delete_award].each { |award| 
        Award.find(award[0]).destroy if award[1] == '1'} if params[:delete_award]  
        
    #Append new award to book if one was entered
    @book.awards << Award.new(:category => params['award'][0]['category'],
                              :year => params['award'][0]['year'],
                              :status => params['award'][0]['status']) if params['award'][0]['category'].length > 0
                               
    if @book.update_attributes(params[:book])
      flash[:notice] = "The book \"#{@book.title}\" was successfully updated."
      redirect_to :action => 'show', :id => @book
    else
      render :action => 'edit'
    end
  end

  def destroy
    Book.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
  
  
end
