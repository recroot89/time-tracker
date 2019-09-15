# frozen_string_literal: true

require 'test_helper'

class Web::EmployeesControllerTest < ActionDispatch::IntegrationTest
  test 'should redirect when user is not logged in' do
    company = companies(:google)
    get employees_url(company_id: company)
    assert_redirected_to login_path
  end

  test 'should get index from home' do
    user = users(:admin)
    login_as(user)

    company = companies(:google)
    get employees_url(company_id: company)
    assert_response :success

    department = departments(:google_finance)
    get employees_url(department_id: department)
    assert_response :success
  end
end
