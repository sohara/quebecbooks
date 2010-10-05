class AdminAreaController < ApplicationController
  before_filter :authorize
  layout "admin_area"
  
  private
  
  def authorize
    unless session[:user_id]
      flash[:notice] = "Please log in"
      redirect_to(:controller => "login", :action => "login_form")
    end
  end
end
