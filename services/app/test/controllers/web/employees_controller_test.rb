# frozen_string_literal: true

require 'test_helper'

class Web::EmployeesControllerTest < ActionDispatch::IntegrationTest
  test 'should redirect when user is not logged in' do
    department = departments(:legros_finance)
    get department_employees_url(department)
    assert_redirected_to login_path
  end

  test 'should get index from company and department' do
    user = users(:admin)
    login_as(user)

    department = departments(:legros_finance)
    get department_employees_url(department)
    assert_response :success
  end

  test 'should redirect from index due to bad requests' do
    user = users(:admin)
    login_as(user)

    get department_employees_url(department_id: 'bad')
    assert { flash[:error] }
    assert_redirected_to home_url

    get department_employees_url(bad: 'bad')
    assert { flash[:error] }
    assert_redirected_to home_url
  end

  test 'should get new' do
    user = users(:admin)
    login_as(user)
    department = departments(:legros_finance)

    get new_department_employee_url(department_id: department)
    assert_response :success
  end

  test 'should get edit' do
    user = users(:admin)
    login_as(user)
    department = departments(:legros_finance)
    employee = department.employees.first

    get edit_employee_url(employee)
    assert_response :success
  end

  test 'should create employee' do
    user = users(:admin)
    login_as(user)
    @department = departments(:legros_lawyers)

    params = {
      employee: {
        first_name: 'Glenn',
        last_name: 'Jordan',
        position: 'Engineer',
        personnel_number: '007',
        tin: '1234567890',
        birth_date: 20.years.ago.to_date,
        begin_date: Time.zone.today,
        department_id: @department.id
      }
    }

    post department_employees_url(department_id: @department.id), params: params
    assert_response :redirect
    assert { flash[:success] }

    employee = @department.employees.last
    assert { employee.first_name == 'Glenn' }
    assert { employee.last_name == 'Jordan' }
    assert { employee.position == 'Engineer' }
    assert { employee.personnel_number == '007' }
    assert { employee.tin == '1234567890' }
    assert { employee.birth_date == 20.years.ago.to_date }
    assert { employee.begin_date == Time.zone.today }
  end

  test 'should not create employee' do
    user = users(:admin)
    login_as(user)

    params = {
      employee: {
        first_name: 'Glenn',
        last_name: 'Jordan',
        position: 'Engineer',
        personnel_number: '007',
        tin: '1234567890',
        birth_date: 20.years.ago.to_date,
        begin_date: Time.zone.today,
        department_id: 'bad'
      }
    }

    post department_employees_url(department_id: 'bad'), params: params
    assert_response :unprocessable_entity
    assert { flash[:error] }
  end

  test 'should update employee' do
    user = users(:admin)
    login_as(user)
    employee = employees(:legros_lawyers_first)

    params = {
      employee: {
        id: employee.id,
        first_name: 'Glenn',
        last_name: 'Jordan',
        position: 'Engineer',
        personnel_number: '007',
        tin: '1234567890',
        birth_date: 21.years.ago.to_date
      }
    }

    patch employee_url(employee), params: params
    assert_response :redirect
    assert { flash[:success] }

    employee.reload
    assert { employee.first_name == 'Glenn' }
    assert { employee.last_name == 'Jordan' }
    assert { employee.position == 'Engineer' }
    assert { employee.personnel_number == '007' }
    assert { employee.tin == '1234567890' }
    assert { employee.birth_date == 21.years.ago.to_date }
  end
end
