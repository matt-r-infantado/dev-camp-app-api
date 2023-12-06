class AccessLog < ApplicationRecord
  belongs_to :user
  belongs_to :gate
  belongs_to :nfc
end
