class AccessLogsController < ApplicationController
  def index 
    @access_logs = AccessLog.all
  end
end
