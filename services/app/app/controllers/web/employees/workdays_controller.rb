# frozen_string_literal: true

class Web::Employees::WorkdaysController < Web::ApplicationController
  def index
    @employee = Employee.find(params[:employee_id])
    @workdays = @employee.workdays.page(params[:page]).per(10)
  end

  def create; end

  def update; end
end
