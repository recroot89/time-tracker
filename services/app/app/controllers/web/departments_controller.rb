# frozen_string_literal: true

class Web::DepartmentsController < Web::ApplicationController
  def index
    @company = Company.find(params[:company_id])
  end

  def show
    @department = Department.find(params[:id])
  end

  def update; end
end
