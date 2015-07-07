class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    
       user ||= User.new # guest user (not logged in)
       Rails.logger.debug "USER/NIL: #{user.nil?}"

       Rails.logger.debug "USER/ADMIN: #{user.admin?}"

       Rails.logger.debug "USER/ALUM: #{user.alum?}"
       Rails.logger.debug "alum_id: #{user.alumId}"

       Rails.logger.debug "USER/FACULTY: #{user.faculty?}"
       Rails.logger.debug "faculty_id: #{user.facultyId}"
      can :index, :all
       if user.admin? #everything works for admin
         can :manage, :all

         #user is not admin
       
       #AGHHHHHHHHHHHHH ASKDLFASL;KDFJALS;K
       elsif user.nil?
        Rails.loger.debug "WHY IS IT NIL"
       


       elsif user.alum?
        Rails.logger.debug "in elsif"
        can :update, Alum do |a|
          Rails.logger.debug "Inside do each"  #never gets here.... why?
          Rails.logger.debug "Okay.... #{a.owner}"
          a.owner? user
        end
        

       #elsif !(user.alum_id.nil?) #user is alum #line breaks entire program??
        #can :update, Alum do |a|
         # a.owner? user
        #end

        #elsif (user.facutly_id) != nil
        # can :update, Alum do |alum|
            #alum.try(:user_id) == user._id
            #end
            
     
      #elsif user.faculty_id != nil #user is faculty
       #  can :update, Faculty do |faculty|
       #      faculty.try(:id)== user.faculty_id
       #    end
      

          else 
            can :read, :all
          end
    
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
#end
