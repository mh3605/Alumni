class Faculty < ActiveRecord::Base
has_many :alums 
belongs_to :department
has_many :researchareas

has_one :user

def owner? (user)
		logger.debug("Checking faculty owner?")
		#return id == user.alumId
		return faculty.userId == user.id
	end

end
