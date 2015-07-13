require 'test_helper'

class GeneralUserFlowTest < ActionDispatch::IntegrationTest
  setup do
  	https!
    get "/profile/users/sign_in"
    assert_response :success

    #created new user emily
    @newuser = User.create(email: "user@gmail.com", password: "helloworld", admin: false)
    post_via_redirect "/profile/users/sign_in",
    {user: {email: @newuser.email, password: @newuser.password}}
	
    end

  test "general user browse site" do 
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

  test "alum inability to create/edit other properties" do
	get "/alums/#{alums(:emily).id}/edit"
    assert_response :redirect

  	get "/alums/new"
    assert_response :redirect

    get "/faculties/#{faculties(:jeff_foster).id}/edit"
    assert_response :redirect

    get "/years/new"
    assert_response :redirect

    get "/departments/#{departments(:computer_science).id}/edit"
    assert_response :redirect
  end
end
