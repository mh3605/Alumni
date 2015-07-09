require 'test_helper'

class DepartmentTest < ActiveSupport::TestCase
  test "name validation" do
  	department = Department.new(:name => "")
  	assert_not department.valid?
  	department.update_attribute(:name, "name")
  	assert department.valid?
  end
end
