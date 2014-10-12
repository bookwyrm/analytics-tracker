class RegistrationForm < Reform::Form
  include Composition

  property :company_name, on: :account
  property :email, on: :user
  property :password, on: :user
  property :password_confirmation, on: :user, empty: true

  model :user

  extend ActiveModel::ModelValidations
  copy_validations_from User
  validates :company_name, presence: true

  def active_for_authentication?
    true
  end

  def authenticatable_salt
  end

  def save
    return false unless valid?
    super
  end
end
