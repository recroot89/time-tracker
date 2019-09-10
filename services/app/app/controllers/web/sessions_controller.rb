# frozen_string_literal: true

class Web::SessionsController < Web::ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      login(user)
      f(:success)
      redirect_to root_url
    else
      f(:error)
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
    logout if logged_in?
    f(:success)
    redirect_to root_url
  end
end
