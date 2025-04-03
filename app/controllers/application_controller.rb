class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :authenticate_user!

  private

  def after_sign_in_path_for(resource)
    articles_path # Redirect to articles index after login
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path # Redirect to login page after logout
  end
end
