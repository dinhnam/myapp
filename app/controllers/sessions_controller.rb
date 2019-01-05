class SessionsController < ApplicationController
  def new
    
  end

  def create
    user = User.find_by email: params[:email].downcase
    if user && user.authenticate(params[:password])
      generate_session_login user
      generate_cookie_remember(user) if params[:remember] == '1'
      flash[:success] = "Wellcome " + user.name
      redirect_to root_url
    elsif
      flash[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    logout if logged_in?
    redirect_to root_url
  end
end
