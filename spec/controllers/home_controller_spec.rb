require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  context 'when a user is logged in' do
    let(:user) { FactoryBot.create(:user) }


    describe "Get #secret page that require login" do
      it "returns a http success" do

        sign_in user

        get :secret
        expect(response).to have_http_status(:success)
      end
    end

    describe "After a successfull login" do
     pending "should redirect to the secret page"

    end

  end

  context 'when a user is logged out' do

    describe 'A visitor that is not registered must not access the secret page' do
      it "it should show you need to login first" do

        get :secret
        expect(response).to redirect_to("/auth/login")
        expect(flash[:alert]).to be_present
      end
    end

  end

  context 'normale request specs' do

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


  end



end
