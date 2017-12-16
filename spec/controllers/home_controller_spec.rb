require 'rails_helper'

RSpec.describe HomeController, type: :controller do


  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "Get root path" do
    it "returns http success for accessing root path" do
      expect(get: root_url(subdomain: nil)).to route_to(
        controller: "home",
        action: "index")
    end
  end

  describe "Get #secret page that require login" do
    it "returns a http success" do

      @user = FactoryBot.create(:user)
      sign_in @user

      get :secret
      expect(response).to have_http_status(:success)
    end
  end

  describe 'A visitor that is not registered must not access the secret page' do
    pending it "it should show you need to login first"


  end


end
