module SessionsHelper
  def login_user user
    session[:user_id] = user.id
  end

  def remember_user user
    cookies.permanent.signed[:user_id] = {value: user.id,
                                          expires: 1.week.from_now}
    cookies.permanent[:remember_token] = {value: user.generate_token(
                                  :remember_digest), expires: 1.week.from_now}
  end

  def current_user
    if user_id = session[:user_id]
      @current_user ||= User.find_by id: user_id
    elsif user_id = cookies.signed[:user_id]
      user = User.find_by id: user_id
      if user && user.authenticated?(:remember_digest, cookies[:remember_token])
        login_user user
        @current_user = user
      end
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def forget user
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  def logout
    forget current_user
    session.delete(:user_id)
    @current_user = nil
  end
end
