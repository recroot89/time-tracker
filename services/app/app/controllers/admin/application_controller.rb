# frozen_string_literal: true

class Admin::ApplicationController < ApplicationController
  include WebSessionManagement
  include FlashHelper

  before_action :authenticate_user!
  before_action do
    head 404 unless current_user.admin?
  end
end
