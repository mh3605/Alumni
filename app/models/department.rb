class Department < ActiveRecord::Base
	has_many :alums
	has_many :faculties 

	validates :name, :presence => true
end
