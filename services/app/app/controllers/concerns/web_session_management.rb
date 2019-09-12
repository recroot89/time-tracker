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

  private

  def authenticate_user!
    return if logged_in?

    respond_to do |format|
      format.json { render json: 'Please log in', status: :found }
      format.html do
        flash[:error] = I18n.t('.flash.web.auth_user.error.log_in')
        redirect_to login_path
      end

      format.any { redirect_to login_path }
    end
  end
end
