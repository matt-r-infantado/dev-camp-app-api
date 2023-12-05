class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token, if: :json_request?

  attr_reader :current_admin

  def must_be_authenticated
    token = UserSession.find_by_token session[:token]
    if token.nil?
      session.clear
      redirect_to sessions_path
    else
      @current_admin = token.user
    end
  end
  
  private

  def json_request?
    request.format.json?
  end
end
