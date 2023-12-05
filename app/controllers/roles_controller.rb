class RolesController < ApplicationController
  before_action :must_be_authenticated
  
  def index 
    @roles = Role.all
  end

  def create 
    Role.create role_params
    redirect_to roles_path
  end

  private 

  def role_params 
    params.permit(:name)
  end
end
