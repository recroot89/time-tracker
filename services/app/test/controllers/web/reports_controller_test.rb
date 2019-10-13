# frozen_string_literal: true

require 'test_helper'

class Web::ReportsControllerTest < ActionDispatch::IntegrationTest
  test 'should redirect when user is not logged in' do
    company = companies(:legros)

    get request_report_url(company_id: company)
    assert_redirected_to login_path
  end

  test 'should get index when user logged in' do
    user = users(:admin)
    login_as(user)

    company = companies(:legros)

    get request_report_url(company_id: company)
    assert { response.status == 200 }
  end

  test 'should get show' do
    user = users(:admin)
    login_as(user)

    department = departments(:legros_finance)

    params = {
      report: {
        department: department.id,
        year: 2019,
        month: 1
      }
    }
    get report_url, params: params

    assert_response :success
  end
end
