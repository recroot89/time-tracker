# frozen_string_literal: true

class Web::UsersController < Web::ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      f(:success)
      redirect_to login_path
    else
      render 'new', status: :unprocessable_entity
    end
  rescue ActiveRecord::RecordNotUnique
    @user.errors.add(:email, :not_uniq)
    render 'new', status: :unprocessable_entity
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :password)
  end
end
