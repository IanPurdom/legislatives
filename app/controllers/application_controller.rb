class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  include Pundit
  
  protected
  def after_sign_in_path_for(resource)
    if current_user.role.code == 'CAN' && !candidate.nil?
    request.env['omniauth.origin'] || stored_location_for(resource) || candidate_path(candidate)
    else 
      request.env['omniauth.origin'] || stored_location_for(resource) || candidates_path
    end  
  end

  # Pundit: white-list approach.
  # after_action :verify_authorized, except: :index, unless: :skip_pundit?
  # after_action :verify_policy_scoped, only: :index, unless: :skip_pundit

  # Uncomment when you *really understand* Pundit!
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(root_path)
  # end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end


  def candidate
    current_user.candidate
  end

end
