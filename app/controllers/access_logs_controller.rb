class AccessLogsController < ApplicationController
  def index 
    @access_logs = AccessLog.all.order(id: :desc)
  end
end
