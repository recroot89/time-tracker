# frozen_string_literal: true

require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test 'should get login page' do
    get login_url
    assert_response :success
  end

  test 'create user session' do
    user = users(:admin)
    params = { session: { email: user.email, password: 'password' } }

    post login_url, params: params

    assert_response :redirect
    assert { flash[:success] }
    assert { logged_in? }
    assert { response.redirect_url == home_url }
  end

  test 'bad password' do
    user = users(:admin)
    params = { session: { email: user.email, password: 'bad_pass' } }

    post login_url, params: params

    assert { response.status == 422 }
  end

  test 'bad email' do
    params = { session: { email: 'bad@email.test', password: 'password' } }

    post login_url, params: params

    assert { response.status == 422 }
  end

  test 'destroy session' do
    user = users(:admin)
    login_as(user)

    delete logout_url

    assert { session[:user_id].nil? }
    assert { !logged_in? }
    assert { flash[:success] }
    assert { response.status == 302 }
    assert { response.redirect_url == root_url }
  end
end
