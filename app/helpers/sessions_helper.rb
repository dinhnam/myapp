module SessionsHelper
  def generate_session_login user
    session[:user_id] = user.id
  end

  def generate_cookie_remember user
    cookies.permanent.signed[:user_id] = {value: user.id,
                                          expires: 1.week.from_now}
    cookies.permanent[:remember_token] = {value: user.generate_remember_token,
                                          expires: 1.week.from_now}
  end

  def current_user
    if user_id = session[:user_id]
      @current_user ||= User.find_by id: user_id
    elsif user_id = cookies.signed[:user_id]
      user = User.find_by id: user_id
      if user && user.authenticated?(cookies[:remember_token])
        generate_session_login user
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
