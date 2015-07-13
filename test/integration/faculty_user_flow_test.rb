require 'test_helper'

class FacultyUserFlowTest < ActionDispatch::IntegrationTest
  setup do
  	https!
    get "/profile/users/sign_in"
    assert_response :success

    #created new user michael (faculty)
    @facultymichael = User.create(email: "facultymichael@gmail.com", password: "helloworld", admin: false)
    post_via_redirect "/profile/users/sign_in",
    {user: {email: @facultymichael.email, password: @facultymichael.password}}
	
	#linked michael faculty to user
	faculties(:michael_hicks).update_attribute(:user, @facultymichael)
	assert_response :success
    #puts flash.inspect
    end

  test "faculty browse site" do 
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

  test "faculty's ability to edit own profile" do
  	get "/faculties/#{faculties(:michael_hicks).id}/edit"
    assert_response :success
  end

   test "faculty's ability to edit their former alums" do
  	get "/alums/#{alums(:emily).id}/edit"
    assert_response :success
  end

  test "faculty inability to edit alums that they did not supervise" do
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
