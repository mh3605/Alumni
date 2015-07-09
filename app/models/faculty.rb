class Faculty < ActiveRecord::Base
has_many :alums 
belongs_to :department
has_many :researchareas

belongs_to :user, :foreign_key => "user_id"

validates :name, :presence => true

def owner? (user)
		logger.debug("Checking faculty owner?")
		#return id == user.alumId
		return faculty.userId == user.id
	end

end
