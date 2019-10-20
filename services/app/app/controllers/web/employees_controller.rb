# frozen_string_literal: true

class Web::EmployeesController < Web::ApplicationController
  def index
    @department = Department.find(params[:department_id])
    @employees = @department.employees.page(params[:page]).per(10)
  rescue ActiveRecord::RecordNotFound
    f(:error)
    redirect_to home_path
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def new
    @employee = Employee.new
  end

  def edit
    @employee = Employee.find(params[:id])
  end

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

  def update
    @employee = Employee.find(params[:id])
    @employee.attributes = employee_params

    if @employee.valid?
      @employee.save!
      f(:success)
      redirect_to edit_employee_url(@employee)
    else
      f(:error)
      render :edit, status: :unprocessable_entity
    end
  end

  def show_all
    @company = Company.find(params[:company_id])
    @employees = Employee.where(department_id: @company.departments).includes(:department).page(params[:page]).per(10)
  end

  private

  def employee_params
    params.require(:employee).permit(
      :first_name, :last_name, :position, :personnel_number, :tin,
      :birth_date, :begin_date, :company_id, :department_id
    )
  end
end
