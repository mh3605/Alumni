require 'test_helper'

class AdminUserFlowTest < ActionDispatch::IntegrationTest
 test "login and browse site" do
    # login via https
    https!
    get "/profile/users/sign_in"
    assert_response :success

    @admin1 = User.create(email: "admin1@gmail.com", password: "helloworld", admin: true)
    post_via_redirect "/profile/users/sign_in",
    {user: {email: @admin1.email, password: @admin1.password}}
#    { "user[email]" => @admin1.email,
#        "user[password]" => @admin1.password}
    assert_response :success
    puts flash.inspect
    puts @request.raw_post
   
  end
end
