# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :must_be_authenticated, unless: :json_request?
	
	def new
	end
	
	def index
		@users = User.all
    respond_to do |format|
      format.html # Render the HTML view (default behavior)
      format.json { render json: { users: @users } }
    end
	end

	def create
		User.create user_params
		
		redirect_to users_path
		# render json: { message: :created }
	end

	def assign_nfc 
		user = User.find(params[:user_id])
		tags = Nfc.where(tag: params[:tag])
		if tags.present? 
			render json: {message: "Tag is already assigned"}
		else
			user.nfcs.create tag: params[:tag]
			render json: {message: "Tag assigned"}
		end
	end

	private

	def user_params
		params.permit( %i[first_name last_name email role_id device_id username password] )
	end
end
