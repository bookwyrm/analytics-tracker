class RegistrationForm < Reform::Form
  include Composition

  property :company_name, on: :account
  property :email, on: :user
  property :password, on: :user
  property :password_confirmation, on: :user, empty: true

  model :user

  validates :email, presence: true
  validates :password, presence: true, confirmation: true
  validates :password, length: { minimum: 8 }
  validates :company_name, presence: true

  def active_for_authentication?
    true
  end

  def authenticatable_salt
  end

  def save
    return false unless valid?
    sync
    user = model[:user]
    user.account = model[:account]
    user.save
  end
end
