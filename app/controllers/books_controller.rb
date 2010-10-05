class BooksController < ApplicationController
  auto_complete_for :book, :title
  
  def index
    @books = Book.paginate :page => params[:page], :order => 'title', :include => [:authors, :writers, :translators, :awards, :images]
  end
  
  def view
    @book = Book.find(params[:id])
    @books = Book.find(:all, :order => "title")
    @book_current = @books.index(@books.find{|h| h.id == @book.id })
    @book_next = @books[@book_current+1]
    @book_previous = @books[@book_current-1]
    @book_number = @book_current+1
  end
  
  def search
    @books = Book.find( :all, :conditions => ["LOWER(title) LIKE ?", '%' + params[:book][:title].downcase + '%' ])
    if @books.size == 1
      redirect_to :action => 'view', :id => @books[0]
    elsif @books.size > 1
        @pages, @books = paginate(:book,
          :per_page => 20,
          :conditions => ["LOWER(title) LIKE ?", '%' + params[:book][:title].downcase + '%' ],
          :order_by => 'title')
      flash[:notice] = 'Your seach results'
      render_action 'list'
    else
      flash[:notice] = 'Your search returned nothing'
      redirect_to :action => 'index'
    end  
  end
  
  def genre
    @books = Book.where("books.category = ?", params[:genre]).paginate :page => params[:page], :order => 'title', :include => [:authors, :writers, :translators, :awards, :images]
    flash[:notice] = "Browse by genre: #{params[:genre]}"
    render 'index'
  end
  

  
end
