class SessionsController < ApplicationController
  def new
    
  end

  def create
    user = User.find_by email: params[:email].downcase

    if user && user.authenticate(params[:password])
      generate_session_user user
      flash[:success] = 'Log in success'
      redirect_to root_url
    elsif
      flash[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    logout
    redirect_to root_url
  end
end
