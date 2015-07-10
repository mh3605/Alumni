class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  #:lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable #, :confirmable
 
 has_one :alum
 has_one :faculty

 def admin?
	admin
 end	

 def alum?
 return !(alum.nil?)
 end

 def alumId
 	if alum.nil? 
 		return nil
 	else
 		return alum.id
 	end
 end

  def facultyId
 	if faculty.nil? 
 		return nil
 	else
 		return faculty.id
 	end
 end

 def faculty?
 	return !(faculty.nil?)
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
