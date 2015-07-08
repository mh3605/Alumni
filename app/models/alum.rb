class Alum < ActiveRecord::Base
	belongs_to :faculty
	belongs_to :year
	belongs_to :department
	belongs_to :employer
	belongs_to :researcharea
	belongs_to :initialemployer

	has_one :user

	def owner? (user)
		logger.debug("Checking alum owner?")
		return user_id== user.id
		#return id == user.alumId
	end
end
