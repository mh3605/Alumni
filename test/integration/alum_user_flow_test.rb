require 'test_helper'

class AlumUserFlowTest < ActionDispatch::IntegrationTest
  setup do
  	https!
    get "/profile/users/sign_in"
    assert_response :success

    #created new user emily
    @alumemily = User.create(email: "alumemily@gmail.com", password: "helloworld", admin: false)
    post_via_redirect "/profile/users/sign_in",
    {user: {email: @alumemily.email, password: @alumemily.password}}
	
	#linked emily alum to user
	alums(:emily).update_attribute(:user, @alumemily)
	assert_response :success
    #puts flash.inspect
    end

  test "alum browse site" do 
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

  test "alum's ability to edit own alum profile" do
  	get "/alums/#{alums(:emily).id}/edit"
    assert_response :success
  end

  test "alum inability to edit other alum profiles" do
  	get "/alums/#{alums(:michelle).id}/edit"
    assert_response :redirect
  end

  test "alum inability to create/edit other properties" do
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
