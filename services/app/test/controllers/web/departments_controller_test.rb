# frozen_string_literal: true

require 'test_helper'

class Web::DepartmentsControllerTest < ActionDispatch::IntegrationTest
  test 'should redirect when user is not logged in' do
    company = companies(:default)
    get departments_url(company_id: company)
    assert_redirected_to login_path
  end

  test 'should get index when user logged in' do
    user = users(:default)
    login_as(user)
    company = companies(:default)

    get departments_url(company_id: company)
    assert { response.status == 200 }
  end

  test 'should get show' do
    user = users(:default)
    login_as(user)
    department = departments(:default)

    get department_url(department)
    assert { response.status == 200 }
  end
end
