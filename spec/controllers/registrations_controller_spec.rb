require 'rails_helper'

RSpec.describe RegistrationsController, type: :controller do
  before :each do
    @request.env['devise.mapping'] = Devise.mappings[:user]
  end

  describe "POST #create" do
    let(:post_params) { attributes_for(:user).merge(attributes_for(:account)) }

    it "Creates a user" do
      expect {
        post :create, user: post_params
      }.to change(User, :count).by(1)
    end

    it "Creates an account" do
      expect {
        post :create, user: post_params
      }.to change(Account, :count).by(1)
    end

    it "Associates the user with the account" do
      post :create, user: post_params
      user = User.last
      account = Account.last
      expect(user.account).to eq(account)
    end

    it "Assigns sharding key to account" do
      post :create, user: post_params
      account = Account.last
      user = User.last
      sharding_key = ShardingHelper.generate_sharding_key(user.email)
      expect(account.sharding_key).to eq(sharding_key)
    end
  end
end
