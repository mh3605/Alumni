require 'test_helper'

class AdminUserFlowTest < ActionDispatch::IntegrationTest

setup do
    https!
    get "/profile/users/sign_in"
    assert_response :success

    @admin1 = User.create(email: "admin1@gmail.com", password: "helloworld", admin: true)
    post_via_redirect "/profile/users/sign_in",
    {user: {email: @admin1.email, password: @admin1.password}}
#    { "user[email]" => @admin1.email,
#        "user[password]" => @admin1.password}
    assert_response :success
    #puts flash.inspect
    #puts @request.raw_post
end

 test "admin browses site" do
   get "/alums"
   assert_response :success

    get "/faculties"
   assert_response :success

    get "/years"
   assert_response :success

    get "/alums/#{alums(:michelle).id}"
   assert_response :success

    get "/faculties/#{faculties(:jeff_foster).id}"
    assert_response :success 
  end

  test "admin edits/creates everything" do
     #print "Alum id: #{alums(:michelle).id}"
   get "/alums/#{alums(:michelle).id}/edit"
    assert_response :success

    get "/alums/new"
    assert_response :success

    get "/faculties/#{faculties(:jeff_foster).id}/edit"
    assert_response :success

    get "/researchareas/#{researchareas(:graphics).id}/edit"
    assert_response :success
  end
end
