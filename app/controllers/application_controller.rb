class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  class Error < StandardError; end
  class BadRequest < Error; end

  rescue_from BadRequest do |e|
    head :bad_request
  end

  protected

  def current_language
    session[:language] || 0
  end

  def enhanced_referrer
    request.referrer || root_path
  end

  def render_404
    respond_to do |format|
      format.html { render :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found }
      format.xml  { head :not_found }
      format.any  { head :not_found }
    end 
  end

  private

  def mobile_device?
    request.user_agent =~ /Mobile|webOS/
  end

  helper_method :mobile_device?, :current_language
end
