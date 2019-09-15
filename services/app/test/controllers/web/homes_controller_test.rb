# frozen_string_literal: true

require 'test_helper'

class HomesControllerTest < ActionDispatch::IntegrationTest
  test 'should redirect when user is not logged in' do
    get home_url
    assert_redirected_to login_path
  end

  test 'should show main page when user is logged in' do
    user = users(:default)
    login_as(user)

    get home_url
    assert { response.status == 200 }
  end
end
