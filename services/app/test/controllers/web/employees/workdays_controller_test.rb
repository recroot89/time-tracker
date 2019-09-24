# frozen_string_literal: true

require 'test_helper'

class Web::Employees::WorkdaysControllerTest < ActionDispatch::IntegrationTest
  test 'should redirect when user is not logged in' do
    employee = employees(:google_finance_first)

    get employee_workdays_url(employee_id: employee)
    assert_redirected_to login_path
  end

  test 'should get index when user logged in' do
    user = users(:default)
    login_as(user)
    employee = employees(:google_finance_first)

    get employee_workdays_url(employee_id: employee)
    assert { response.status == 200 }
  end
end
