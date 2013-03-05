class SessionsController < ApplicationController
  
  def new
  end
  
  def create
    user = User.find_by_userName(params[:session][:userName])
    if user &&  user.authenticate(params[:session][:password]) && user.is_admin?
      sign_in user
      redirect_to users_url
    elsif user &&  user.authenticate(params[:session][:password])
      flash.now[:error] = "Need Admin privileges to login"
      render 'new'
    else
      flash.now[:error] = "Invalid username/password combo"
      render 'new'
    end
  end
  
  def destroy
    sign_out
    redirect_to root_url
  end
  
end
