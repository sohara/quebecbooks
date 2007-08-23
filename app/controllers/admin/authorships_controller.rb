class Admin::AuthorshipsController < ApplicationController
  
  # Render a table row with form for a new authorship, passing the release id
  def new
    @authors = Author.find( :all, :order => 'last_name')
    @book = Book.find(params[:id])
    render :update do |page|
      page.insert_html :top, "trows", :partial => 'admin/authorships/new_authorship_row'
    end
  end
  
  def create
    @book = Book.find(params[:id])
    @authorship = Authorship.new(params[:authorship])
    @authorship.book_id = params[:id]
    @book = Book.find(params[:id])
    if @authorship.save
      @book = Book.find(params[:id])
      render :update do |page|
        page[:authorships].replace_html :partial => 'admin/authorships/show_authorships' 
      end
    end
  end
  
  # Display form to manuually edit attributes of an authorship
  def edit
    @authorship = Authorship.find(params[:id])
    @authors = Author.find( :all, :order => 'last_name')
    render :update do |page|
      page["authorship#{@authorship.id}"].replace_html :partial => 'admin/authorships/edit_authorship_row_cells', :object => @authorship
      page["authorship#{@authorship.id}"].visual_effect :highlight, :startcolor => "#cf2121", :endcolor => "#fff"
    end
  end
  
  # Cancel editing of song so display regular row for viewing rather than editing
  def cancel
    @authorship = Authorship.find(params[:id])
    @book = @authorship.book
    render :partial => "admin/authorships/authorship_row"
  end
  
  # Destroy an existing song
  def destroy
    Authorship.find(params[:id]).destroy
    render :update do |page|
      page["authorship#{params[:id]}"].remove
    end
  end
  
end
