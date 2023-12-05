class SessionsController < ApplicationController
  def index
    redirect_to root_path if session[:token].present?
  end

  def logout
    session.clear
    redirect_to root_path
  end

  def create
    admin = User.where(username: params[:username]).last
    if admin.present?
      if admin.authenticate params[:password]
        admin_session = admin.user_sessions.create
        session[:token] = admin_session.token
        redirect_to root_path
      else
        flash.alert = 'Invalid Account'
        redirect_to sessions_path
      end
    else
      flash.alert = 'Invalid Account'
      redirect_to sessions_path
    end
  end
end
