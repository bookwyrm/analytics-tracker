require 'rails_helper'

RSpec.describe RegistrationsController, type: :controller do
  before :each do
    @request.env['devise.mapping'] = Devise.mappings[:user]
  end

  describe "POST #create" do
    it "Creates a user" do
      expect {
        post :create, registration: attributes_for(:user).merge(attributes_for(:account))
      }.to change(User, :count).by(1)
    end

    it "Creates an account" do
      pending
    end

    it "Associates the user with the account" do
      pending
    end
  end
end
