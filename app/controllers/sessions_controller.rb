class SessionsController < ApplicationController
  def login
    render 'new'
  end

  def activation
    user = User.find_by email: params[:email]
    if user && !user.activated? && user.authenticated?(:activation_digest,
                                                        params[:token])
      user.activate
      login_user user
      flash[:success] = "Account activated!"
      redirect_to root_url
    else
      flash[:danger] = "Invalid activation link"
      redirect_to root_url
    end
  end

  def create
    user = User.find_by email: params[:email].downcase
    if user && user.authenticate(params[:password])
      if user.activated?
        login_user user
        params[:remember] == '1'? remember_user(user) : forget(user)
        flash[:success] = "Wellcome " + user.name
        redirect_to root_url
      else
        message  = "Account not activated. "
        message += "Check your email for the activation link."
        flash[:info] = message
        redirect_to root_url
      end
    else
      flash[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    logout if logged_in?
    redirect_to root_url
  end
end
