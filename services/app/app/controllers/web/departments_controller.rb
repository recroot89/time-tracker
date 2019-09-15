# frozen_string_literal: true

class Web::DepartmentsController < Web::ApplicationController
  def index
    @company = Company.find(params[:company_id])
  rescue ActiveRecord::RecordNotFound
    f(:error)
    redirect_to home_path
  end

  def show
    @department = Department.find(params[:id])
  end

  def update; end
end
