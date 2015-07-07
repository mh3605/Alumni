class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  #:lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable #, :confirmable
 
 belongs_to :alumni
 belongs_to :faculty

 def admin?
	admin
 end	

 def alum?
 	logger.debug("In alum method: #{!(alum_id.nil?)}")
 return !(alum_id.nil?)
 end

 def alumId
 	if alum_id.nil? 
 		return
 	else
 		return alum_id
 	end
 end

  def facultyId
 	if faculty_id.nil? 
 		return
 	else
 		return faculty_id
 	end
 end

 def faculty?
 	logger.debug("In faculty method: #{!(faculty_id.nil?)}")
 	return !(faculty_id.nil?)
 end
end
