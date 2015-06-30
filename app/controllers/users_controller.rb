class UsersController < ApplicationController
  def index
   @users = Users.all
  end

  def edit
  
  end

  def show
  end
end
