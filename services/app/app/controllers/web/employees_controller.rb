# frozen_string_literal: true

class Web::EmployeesController < Web::ApplicationController
  def index
    @department = Department.find(params[:department_id])
    @employees = @department.employees.page(params[:page]).per(10)
    @company = @department.company
  rescue ActiveRecord::RecordNotFound
    f(:error)
    redirect_to home_path
  end

  def new
    @employee = Employee.new
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def update; end

  def create
    @employee = Employee.new(employee_params)

    if @employee.valid?
      @employee.save!
      f(:success)
      redirect_to new_department_employee_url(@employee.department_id)
    else
      f(:error)
      render :new, status: :unprocessable_entity
    end
  end

  private

  def employee_params
    params.require(:employee).permit(
      :first_name, :last_name, :position, :personnel_number, :tin,
      :birth_date, :begin_date, :company_id, :department_id
    )
  end
end
