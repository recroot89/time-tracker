# frozen_string_literal: true

class Web::WelcomeController < Web::ApplicationController
  skip_before_action :authenticate_user!

  def index
    return(redirect_to home_url) if logged_in?
  end
end
