# frozen_string_literal: true

require 'test_helper'

class Web::CompaniesControllerTest < ActionDispatch::IntegrationTest
  test 'should redirect when user is not logged in' do
    company = companies(:apple)
    get company_url(company)
    assert_redirected_to login_path
  end

  test 'should get show' do
    user = users(:admin)
    login_as(user)

    get company_url(user.companies.first)
    assert_response :success
  end

  # TODO: add Company create update archive tests and validations
end
