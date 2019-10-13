# frozen_string_literal: true

require 'test_helper'

class Web::Employees::WorkdaysControllerTest < ActionDispatch::IntegrationTest
  test 'should redirect when user is not logged in' do
    employee = employees(:legros_finance_first)

    get department_employee_workdays_url(department_id: employee.department_id, employee_id: employee)
    assert_redirected_to login_path
  end

  test 'should get index when user logged in' do
    user = users(:default)
    login_as(user)
    employee = employees(:legros_finance_first)

    get department_employee_workdays_url(department_id: employee.department_id, employee_id: employee)
    assert { response.status == 200 }
  end
end
