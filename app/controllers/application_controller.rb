class ApplicationController < ActionController::API
  before_action :set_default_request_format

  def set_default_request_format
    request.format = :json
  end
end
