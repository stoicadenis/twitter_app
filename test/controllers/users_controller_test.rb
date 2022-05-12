require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "users new" do
    get new_user_path
    assert_response :success
    assert_select 'label', 'Email'
  end

  test 'users create - invalid' do
    post users_path, params: {user: {name: 'George'}}
    assert_response :success
    assert_select 'div', "Password can't be blank"
    assert_select 'div', "Email can't be blank"
  end

  test 'users create - invalid email' do
    initial_user_count = User.count
    post users_path, params: {user: {name: 'George', password: '123', age: 21, gender: 'Male', phone_number: '0737705856'}}
    assert_response :success
    assert_equal User.count, initial_user_count + 1
    user = User.last
    assert_equal user.name, 'George'
    assert_equal user.password, '123'
  end

  test 'users create - valid' do
    initial_user_count = User.count
    post users_path, params: {user: {name: 'George', password: '123', email: 'stoica@gmail.com', age: 21, gender: 'Male', phone_number: '0737705856'}}
    assert_response :redirect
    assert_equal User.count, initial_user_count + 1
    user = User.last
    assert_equal user.name, 'George'
    assert_equal user.password, '123'
  end

  test 'users page - without login' do
    get users_path
    assert_response :success
  end
end
