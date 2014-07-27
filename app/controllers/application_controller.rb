class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  class Error < StandardError; end
  class BadRequest < Error; end

  rescue_from BadRequest do |e|
    head :bad_request
  end


  private

  def mobile_device?
    request.user_agent =~ /Mobile|webOS/
  end

  helper_method :mobile_device?
end
