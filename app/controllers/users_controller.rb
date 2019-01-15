class UsersController < ApplicationController

  def new
  end

  def create
    puts params
    user = User.new user_params
    if user.save
      UserMailer.account_activation(user).deliver_now
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
    elsif
      flash[:danger] = "Account creation failed"
      render 'new'
    end
  end

  def edit
  end

  def show
  end

  def index
  end
  private

    def user_params
      params.require(:user).permit :name, :email, :password,
                                   :password_confirmation
    end
end