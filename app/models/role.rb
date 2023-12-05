class Role < ApplicationRecord
  has_many :gate_permissions
	belongs_to :user
end
