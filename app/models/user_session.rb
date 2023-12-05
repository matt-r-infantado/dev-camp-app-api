class UserSession < ApplicationRecord
  belongs_to :user

  TOKEN_EXPIRE_AFTER = 1.hour

  before_create :generate_token

  def active?
    valid_at >= Time.current
  end

  def expired?
    !active?
  end

  def update_expiration
    update valid_at: expire_time
  end

  private

  def generate_token
    self.token = Digest::SHA1.hexdigest("#{id}_#{Time.current}")
    self.valid_at = expire_time
  end

  def expire_time
    Time.current + TOKEN_EXPIRE_AFTER
  end
end
