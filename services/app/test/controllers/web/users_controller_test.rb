# frozen_string_literal: true

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test 'show sign_up form' do
    get signup_url
    assert { response.status == 200 }
  end

  test 'bad user validation' do
    params = { user: { name: 'name' } }

    post signup_url, params: params

    assert_response :unprocessable_entity
  end

  test 'create new user' do
    params = {
      user: {
        name: 'name',
        email: 'test@test.test',
        password: 'password'
      }
    }

    perform_enqueued_jobs do
      post signup_url, params: params
    end

    assert_redirected_to :login
    assert { flash[:success] }

    user = User.find_by(email: params[:user][:email])
    assert { user.name == 'name' }
    assert { user.email == 'test@test.test' }
  end

  test 'should not create user with blank email' do
    params = {
      user: {
        name: 'Test',
        password: 'password'
      }
    }

    perform_enqueued_jobs do
      post signup_url, params: params
    end

    assert_response :unprocessable_entity
  end

  test 'should not create user with blank name' do
    params = {
      user: {
        email: 'test@test.test',
        password: 'password'
      }
    }

    perform_enqueued_jobs do
      post signup_url, params: params
    end

    assert { flash[:error] }
    assert_response :unprocessable_entity
  end

  # VALIDATIONS

  test 'handle uniq email error for existed user' do
    @user = users(:default)
    params = {
      user: {
        name: 'New name',
        email: 'admin@test.local',
        password: 'password'
      }
    }

    post signup_url, params: params

    assert { User.where(email: params[:user][:email]).count == 1 }
    assert_response :unprocessable_entity
  end
end
