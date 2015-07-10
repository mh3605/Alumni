require 'test_helper'

class UserTest < ActiveSupport::TestCase
 test "admin? method" do 
 	assert users(:user_admin).admin?
 	assert_not users(:user_student).admin?
 end

 test "alum? method" do
 	assert users(:user_alum_michelle).alum?
 	assert_not users(:user_faculty_jeff).alum?
 end 

 test "alumId method" do
 	assert users(:user_alum_michelle).alumId == alums(:michelle).id
 end

  test "faculty? method" do
  	assert_not users(:user_alum_michelle).faculty?
 	assert users(:user_faculty_jeff).faculty?
 end

 test "facultyId method" do
 	assert users(:user_faculty_jeff).facultyId == faculties(:jeff_foster).id
 end

 test "getFaculty method" do
 	assert users(:user_faculty_jeff).getFaculty == faculties(:jeff_foster)
 end


end
