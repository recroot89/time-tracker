# frozen_string_literal: true

module WebSessionManagement
  def login(user)
    session[:user_id] = user.id
  end

  def logout
    session[:user_id] = nil
    session.clear
  end

  def logged_in?
    !current_user.guest?
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) || ::Guest.new
  end
end
