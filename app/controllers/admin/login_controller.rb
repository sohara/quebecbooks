class Admin::LoginController < AdminAreaController
  before_filter :authorize, :except => :login
  
  def add_user
    if request.get?
      @user = User.new
    else
      @user = User.new(params[:user])
      if @user.save
        flash[:notice] = "User #{@user.name} created"
        redirect_to( :action => 'index')
      end
    end
  end

  def login
    if request.get?
      session[:user_id] = nil
      @user = User.new
    else
      @user = User.new(params[:user])
      logged_in_user = @user.try_to_login
      if logged_in_user
        session[:user_id] = logged_in_user.id
        redirect_to(:action => "index")
      else
        flash[:notice] = "Invalid user/password combination"
      end
    end
  end

  def index
    @total_books = Book.count
    @total_authors = Author.count
  end
  
  def logout
  end

  def delete_user
  end

  def list_users
  end
end
