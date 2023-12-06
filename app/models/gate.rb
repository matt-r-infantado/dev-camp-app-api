class Gate < ApplicationRecord
  before_create :generate_gate_serial 

  private 

  def generate_gate_serial
    self.serial_number = Digest::SHA1.hexdigest("#{id}_#{Time.current}")
  end
end
