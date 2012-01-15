class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :get_locale

  def get_locale
    @locale = params[:locale]
    @locale ||= "jp"
  end
end
