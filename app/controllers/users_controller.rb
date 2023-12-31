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

	def show
		@user = User.find(params[:id])
	end

	def create
		User.create user_params
		
		redirect_to users_path
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update_columns(**user_update_params)
			redirect_to users_path
		end
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

	def check_access 
		nfc_tag = params[:nfc_tag]
		gate_serial = params[:gate_serial]

		# validation process 
		nfc = Nfc.find_by_tag(nfc_tag)
		gate = Gate.find_by_serial_number(gate_serial)
		if gate.nil? || nfc.nil?
			render json: {message: :denied}, status: 400
		else
			if nfc.user.present?
				access = nfc.user.role.gate_permissions.where(gate_id: gate.id)
				if access.any? 

					if(gate.name == "Main")
						main_gates =  nfc.user.access_logs.today.where(gate_id: gate.id)
						if main_gates.any?
							if main_gates.count % 2 == 0
								render json: {message: "logout.mp3"}
							else
								render json: {message: "login.mp3"}	
							end
						else
							render json: {message: "login.mp3"}
						end
					else
						render json: {message: "access-confirm.mp3"}
					end
					nfc.user.access_logs.create({nfc_id: nfc.id, gate_id: gate.id, is_access: true})
				else
					nfc.user.access_logs.create({nfc_id: nfc.id, gate_id: gate.id, is_access: false})
					render json: {message: "access-denied.mp3"}, status: 400
				end
			else
				render json: {message: "access-denied.mp3"}, status: 400
			end
		end
	end
	private

	def user_params
		params.permit( %i[first_name last_name email role_id device_id username password] )
	end

	def user_update_params
		params.permit( %i[first_name last_name email role_id device_id username disabled] )
	end
end
