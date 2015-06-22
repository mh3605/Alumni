class Department < ActiveRecord::Base
	has_many :alums
	has_many :faculties 
	has_many :researchareas
end
