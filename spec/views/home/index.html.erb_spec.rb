require 'rails_helper'

RSpec.describe "home/index.html.erb", type: :view do



  context "when a user is logged in" do
    let(:user) { FactoryBot.create(:user) }
    

      it "should display the user email adress in the navbar" do
        assign(:user, user)
        sign_in user

        render

        expect(rendered).to have_content user.email
      end
  end

  context "when a visitor visits that is not already an user" do
    it "should display register-links in the navbar" do

      render :template => "layouts/application.html.erb"

      expect(rendered).to have_content("Registrieren")
    end
  end

end
