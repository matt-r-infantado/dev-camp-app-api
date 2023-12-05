class GatesController < ApplicationController
  def index 
    @gates = Gate.all
  end

  def new
  end

  def create 
    Gate.create gate_params
    redirect_to gates_path
  end

  private 

  def gate_params 
    params.permit(:name)
  end
end
