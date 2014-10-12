class RegistrationsController < Devise::RegistrationsController
  def create
    configure_permitted_parameters
    super
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :company_name
  end

  def build_resource(hash = nil)
    self.resource = registration_form = RegistrationForm.new(user: User.new, account: Account.new)
  end

  def after_sign_up_path_for(resource)
    root_path
  end
end
