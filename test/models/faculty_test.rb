require 'test_helper'

class FacultyTest < ActiveSupport::TestCase
 test "name validation" do
  	faculty = Faculty.new(:name => "")
  	assert_not faculty.valid?
  	faculty.update_attribute(:name, "name")
  	assert faculty.valid?
  end

 
end
