require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  test "Visit index page" do
    visit '/'
    # save_and_open_screenshot
    assert_selector 'h1', text: 'Join Streamhub today'
  end

  # test "Login as user" do
  #   visit '/'
  #   login_as(:george)
  #   save_and_open_screenshot
  #   # assert_selector 'h1', text: 'Join Streamhub today'
  # end

  # test "Register as a user with devise" do
  #   visit 'users/sign_in'
  #   # save_and_open_screenshot
  #   assert_selector 'h4', text: 'Log in'
  #   assert_button 'Log in'
  # end


end
