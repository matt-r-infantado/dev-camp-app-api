class Role < ApplicationRecord
  has_many :gate_permissions
end
