class Alum < ActiveRecord::Base
	belongs_to :faculty
	belongs_to :year
	belongs_to :department
	belongs_to :employer
	belongs_to :researcharea
	belongs_to :initialemployer
end
