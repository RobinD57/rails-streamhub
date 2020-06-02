require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  test "Visit index page" do
    visit '/'
    # save_and_open_screenshot
    assert_selector 'h1', text: 'Join Streamhub today'
  end
end
