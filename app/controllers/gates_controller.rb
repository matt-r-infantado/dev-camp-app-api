class GatesController < ApplicationController
  before_action :must_be_authenticated
  
  def index 
    @gates = Gate.all
  end

  def show 
    @gate = Gate.find(params[:id])
    qr_code = RQRCode::QRCode.new(@gate.serial_number, size: 4, level: :m)
    @qr_code_svg = qr_code.as_svg
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
