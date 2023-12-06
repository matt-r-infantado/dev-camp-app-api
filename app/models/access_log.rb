class AccessLog < ApplicationRecord
  belongs_to :user
  belongs_to :gate
  belongs_to :nfc

  scope :today, -> { where(created_at: Time.zone.now.all_day)}
  # Ex:- scope :active, -> {where(:active => true)}
end
