class Alum < ActiveRecord::Base
	has_one :faculty
	has_one :year
	has_one :department
	has_one :employer
	has_many :researchareas
end
