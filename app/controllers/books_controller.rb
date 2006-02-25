class BooksController < ApplicationController
  def index
    list
    render :action => 'list'
  end

  def list
    @book_pages, @books = paginate :book, :per_page => 20, :order_by => 'title'
  end
  
  def view
    @book = Book.find(params[:id])
    @books = Book.find(:all, :order => "title")
    @book_current = @books.index(@books.find{|h| h.id == @book.id })
    @book_next = @books[@book_current+1]
    @book_previous = @books[@book_current-1]
  end
  
  def search
    @books = Book.find( :all, :conditions => ["LOWER(title) LIKE ?", '%' + @params[:book][:title].downcase + '%' ])
    if @books.nitems == 1
      redirect_to :action => 'view', :id => @books[0]
    elsif @books.nitems > 1
      flash[:notice] = 'Your seach results'
      render_action 'list'
    else
      flash[:notice] = 'Your search returned nothing'
      redirect_to :action => 'index'
    end  
  end
  
end
