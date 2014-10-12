require 'rails_helper'

RSpec.describe RegistrationsController, type: :controller do
  before :each do
    @request.env['devise.mapping'] = Devise.mappings[:user]
  end

  describe "POST #create" do
    it "Creates an account" do
      expect {
        post :create, user: attributes_for(:user)
      }.to change(User, :count).by(1)
    end

    it "Creates a user" do
      pending
    end

    it "Associates the user with the account" do
      pending
    end
  end
end
