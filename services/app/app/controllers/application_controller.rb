# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def not_found
    respond_to do |format|
      format.html { render template: 'web/rescues/not_found', layout: false, status: :not_found }
      format.any { head 404 }
    end
  end
end
