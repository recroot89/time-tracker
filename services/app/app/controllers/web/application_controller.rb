# frozen_string_literal: true

class Web::ApplicationController < ApplicationController
  include WebSessionManagement
  include FlashHelper

  before_action :authenticate_user!
end
