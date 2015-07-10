class Alum < ActiveRecord::Base
	belongs_to :faculty
	belongs_to :year
	belongs_to :department
	belongs_to :employer
	belongs_to :researcharea
	belongs_to :initialemployer

	belongs_to :user, :foreign_key => "user_id"


	validates :name, :presence => true

	def owner? (user)
		logger.debug("Checking alum owner?")
		return user_id == user.id
	end
end
