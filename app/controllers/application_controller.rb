class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  before_filter :load_top_subtidders

  def load_top_subtidders
    @top_subtidders = Subtidder.limit(20)
  end

  def auth
    redirect_to new_user_registration_path unless user_signed_in?
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :username
  end
end
