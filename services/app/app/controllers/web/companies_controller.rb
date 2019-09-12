# frozen_string_literal: true

class Web::CompaniesController < Web::ApplicationController
  def show
    @company = Company.find(params[:id])
  end

  def update; end
end
