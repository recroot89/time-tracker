# frozen_string_literal: true

class Web::EmployeesController < Web::ApplicationController
  def index
    if params[:department_id].nil?
      @company = Company.find(params[:company_id])
    else
      @department = Department.find(params[:department_id])
    end
  end

  def new; end

  def show
    @employee = Employee.find(params[:id])
  end

  def update; end

  def create; end
end
