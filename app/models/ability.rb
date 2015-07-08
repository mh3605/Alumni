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

        can :read, :all

      if user.admin? #everything works for admin
         can :manage, :all

         #user is not admin


      elsif user.alum?
        Rails.logger.debug "in alum elsif"
        #NOTHING PAST THIS POINT RUNS
        #https://github.com/activeadmin/activeadmin/issues/1355
        can :update, Alum do |a|
          Rails.logger.debug "Inside alum do each"  #never gets past here.... why?
          Rails.logger.debug "Okay.... #{a.owner? user}"
          a.owner? user
      end

    elsif user.faculty?
        Rails.logger.debug "calling getFaculty"
        Rails.logger.debug "getFaculty returns #{user.getFaculty.inspect}" #returns right faculty
        can :update, user.getFaculty
        Rails.logger.debug "can the user update the faculty? #{can? :update, user.getFaculty}"


      #elsif user.faculty?
       # Rails.logger.debug "in faculty elsif"
        #can :update, Faculty do |f|
         # Rails.logger.debug "Inside faculty do each"  
          #Rails.logger.debug "Okay.... #{a.owner}"
          #f.owner? user
      #end
        
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
