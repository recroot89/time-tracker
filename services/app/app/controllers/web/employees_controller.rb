# frozen_string_literal: true

class Web::EmployeesController < Web::ApplicationController
  def index
    if params[:department_id].nil?
      @company = Company.find(params[:company_id])
      @employees = @company.employees.page(params[:page]).per(10)
    else
      @department = Department.find(params[:department_id])
      @employees = @department.employees.page(params[:page]).per(10)
    end
  rescue ActiveRecord::RecordNotFound
    f(:error)
    redirect_to home_path
  end

  def new; end

  def show
    @employee = Employee.find(params[:id])
  end

  def update; end

  def create; end
end
