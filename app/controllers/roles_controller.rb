class RolesController < ApplicationController
  before_action :must_be_authenticated
  
  def index 
    @roles = Role.all
  end

  def show 
    @role = Role.find(params[:id])
    gate_ids = @role.gate_permissions.pluck(:gate_id)
    @gates = Gate.where.not(id: gate_ids)
  end

  def remove_gate 
    role = Role.find(params[:role_id])
    role.gate_permissions.find_by_id(params[:gate_permission_id]).delete
    redirect_to role_path(role)
  end

  def add_gate
    role = Role.find(params[:role_id])
    gate = role.gate_permissions.create({gate_id: params[:gate_id]})
    redirect_to role_path(role)
  end

  def create 
    p "+=="
    p role_params
    p "+=="
    Role.create role_params
    redirect_to roles_path
  end

  private 

  def role_params 
    params.permit(:name)
  end
end
