# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :must_be_authenticated
	def new
	end

	def index
		@users = User.all
    # render json: @users
	end

	def create
		puts 'user_params: '
		puts user_params
		puts '-=--===-'
		User.create user_params
		
		redirect_to users_path
		# render json: { message: :created }
	end

	private

	def user_params
		params.permit( %i[first_name last_name email role_id device_id username password] )
	end
end
