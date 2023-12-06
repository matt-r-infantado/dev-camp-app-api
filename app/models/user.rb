# frozen_string_literal: true

class User < ApplicationRecord
	has_many :user_sessions
	belongs_to :role, optional: true
	has_many :nfcs
	has_secure_password

	validates :username, :password, presence: true
	validates :username, uniqueness: true
	validates :username, length: { minimum: 5, maximum: 20 }
	validates :password, length: { minimum: 5, maximum: 50 }
end
  