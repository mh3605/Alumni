class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  #:lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable #, :confirmable
 
 belongs_to :alum, :foreign_key => "alum_id"
 belongs_to :faculty, :foreign_key => "faculty_id"

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

 def getFaculty  #returns all the faculty...
 	logger.debug "inside getFaculty method"
 	Faculty.all.each do |f| #it just never goes inside loop... returns Faculty.all
 		logger.debug "inspecting #{f.inspect}"
 		if f.user_id == id 
 			return f 
 		end
 	end
 end

end
