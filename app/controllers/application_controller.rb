class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  include Pundit
  
  protected
  def after_sign_in_path_for(resource)
    if resource.role.code == 'CAN' && resource.candidate.nil?
      request.env['omniauth.origin'] || stored_location_for(resource) || new_candidate_path(resource.candidate)
    elsif resource.role.code == 'CAN' && !resource.candidate.nil?
      request.env['omniauth.origin'] || stored_location_for(resource) || candidate_path(resource.candidate)
    else 
      request.env['omniauth.origin'] || stored_location_for(resource) || candidates_path
    end  
  end

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :role, :password, :password_confirmation])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :role_id, :password, :password_confirmation])
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

end
