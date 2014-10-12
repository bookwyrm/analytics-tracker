class RegistrationsController < Devise::RegistrationsController
  def create
    super
  end

  protected

  def build_resource(hash = nil)
    self.resource = registration_form = RegistrationForm.new(user: User.new, account: Account.new)
  end

  def after_sign_up_path_for(resource)
    root_path
  end
end
