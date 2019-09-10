# frozen_string_literal: true

class Web::ApplicationController < ApplicationController
  include WebSessionManagement
  include FlashHelper
end
