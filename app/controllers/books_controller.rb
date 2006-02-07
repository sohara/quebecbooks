class BooksController < ApplicationController
  before_filter :authorize
  
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
    @book = Book.new(params[:book])
    @book.authors = Author.find(@params[:author_ids]) if @params[:author_ids]
    @book.publishers = Publisher.find(@params[:publisher_ids]) if @params[:publisher_ids]
    @book.images << Image.new(:name => @params[:image][:name],
                              :caption => @params[:image][:caption]) if @params[:image][:name].size > 1000;
    if @book.save
      flash[:notice] = 'Book was successfully created.'
      redirect_to :action => 'show', :id => @book
    else
      render :action => 'new'
    end
  end
  

  def edit
    if params[:id]
      @book = Book.find(params[:id]) 
    else
      @book = Book.find( :first, :conditions => ["title = ?", @params[:book][:title]])
    end  
    @authors = Author.find( :all, :order => 'last_name')
    @publishers = Publisher.find( :all, :order => 'publisher_name')
  end

  def update
    @book = Book.find(params[:id])
    @book.authors = Author.find(@params[:author_ids]) if @params[:author_ids]
    @book.publishers = Publisher.find(@params[:publisher_ids]) if @params[:publisher_ids]
    
    #Append new image to author if it was actually uploaded (checked via size)
    @book.images << Image.new(:name => @params[:image][:name],
                              :caption => @params[:image][:caption]) if @params[:image][:name].size > 1000
                              
    # iterate over checkboxed images to delete them if checked
    params[:delete_image].each { |image| Image.find(image[0]).destroy if image[1] == '1'} if params[:delete_image]
                               
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
