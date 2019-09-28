# frozen_string_literal: true

require 'test_helper'

class Web::EmployeesControllerTest < ActionDispatch::IntegrationTest
  test 'should redirect when user is not logged in' do
    company = companies(:google)
    get employees_url(company_id: company)
    assert_redirected_to login_path
  end

  test 'should get index from company and department' do
    user = users(:admin)
    login_as(user)

    company = companies(:google)
    get employees_url(company_id: company)
    assert_response :success

    department = departments(:google_finance)
    get employees_url(department_id: department)
    assert_response :success
  end

  test 'should redirect from index due to bad requests' do
    user = users(:admin)
    login_as(user)

    get employees_url
    assert { flash[:error] }
    assert_redirected_to home_url

    get employees_url(company_id: 'bad')
    assert { flash[:error] }
    assert_redirected_to home_url

    get employees_url(department_id: 'bad')
    assert { flash[:error] }
    assert_redirected_to home_url

    get employees_url(bad: 'bad')
    assert { flash[:error] }
    assert_redirected_to home_url
  end

  test 'should create employee' do
    user = users(:admin)
    login_as(user)
    @department = departments(:google_lawyers)

    params = {
      employee: {
        first_name: 'Glenn',
        last_name: 'Jordan',
        position: 'Engineer',
        personnel_number: '007',
        tin: '1234567890',
        birth_date: 20.years.ago.to_date,
        begin_date: Time.zone.today,
        department_id: @department.id,
        company_id: @department.company_id
      }
    }

    post employees_url, params: params
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
        department_id: 'bad',
        company_id: 'bad'
      }
    }

    post employees_url, params: params
    assert_response :unprocessable_entity
    assert { flash[:error] }
  end
end
