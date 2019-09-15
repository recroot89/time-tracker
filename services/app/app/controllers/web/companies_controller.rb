# frozen_string_literal: true

class Web::CompaniesController < Web::ApplicationController
  def index
    @companies = current_user.companies
  end

  def show
    @company = Company.find(params[:id])
  end

  def update; end
end
