require 'test_helper'

class AlumTest < ActiveSupport::TestCase
  test "name validation" do
  	alum = Alum.new(:name => "")
  	assert_not alum.valid?
  	alum.update_attribute(:name, "name")
  	assert alum.valid?
  end

  test "getting faculty" do
  	assert_equal faculties(:jeff_foster), alums(:michelle).faculty
  	assert_equal faculties(:michael_hicks), alums(:emily).faculty
  	assert_not_equal faculties(:michael_hicks), alums(:eric).faculty
  end

  test "owner functionality" do
    alum = alums(:michelle)
    assert alum.name == "Michelle"
    user= users(:user_alum_michelle)
    assert user.alum == "michelle"
    assert alum.owner? users(:user_alum_michelle)
  end
end
