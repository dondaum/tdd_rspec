require "rails_helper"

RSpec.feature "User Feature", :type => :feature do
  context "Create a new user" do

    before(:each) do
      visit visit new_user_registration_path
      within(:css, "form#new_user") do
        fill_in "Password", with: "password"
        fill_in "Password confirmation", with: "password"
      end
    end

    scenario "Should be successfull" do

      within(:css, "form#new_user") do
        fill_in "Email", with: "email@test.de"
      end
      click_button "Sign up"
      expect(page).to have_content "Welcome! You have signed up successfully."

    end

    scenario "Should fail" do

      click_button "Sign up"
      expect(page).to have_content "Email can't be blank"

    end
  end

  context "Update user" do
  #  before do
  #    user = FactoryBot.create(:user)
  #    login_as(user, :scope => :user, :run_callbacks => false)
  #  end

    #https://stackoverflow.com/questions/32628093/using-devise-in-rspec-feature-tests
    # Issue: Devise is based on Warden Rack Middlewere that is only meant to be used by a controller

  # let(:user) { FactoryBot.create(:user) }
   #login_as(user, :scope => :user)

    scenario "should be successful" do

      login_with_warden!
      visit edit_user_registration_path(user)
      within("form") do
        fill_in 'Email', with: 'jane.doe@example.com'
      end

      click_button 'Update User'
      expect(page).to have_content 'User was successfully updated.'
      expect(page).to have_content 'jane.doe@example.com'
  end
 end


end
