require "rails_helper"

RSpec.feature "User Feature", :type => :feature do
  context "Create a new user" do

    before(:each) do
      visit new_user_registration_path
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

    before(:each) do
      @user = FactoryBot.create(:user)
      sign_in @user
    end


    scenario "should be successful" do


      visit edit_user_registration_path

      within(:css, "form#edit_user") do
        fill_in 'Email', with: 'jane.doe@example.com'
        fill_in "Current password", with: @user.password
      end

      click_button 'Update'
      expect(page).to have_content 'Your account has been updated successfully.'
      expect(page).to have_content 'jane.doe@example.com'
    end

    scenario "should fail" do

      visit edit_user_registration_path

      within(:css, "form#edit_user") do
        fill_in 'Email', with: ''
        fill_in "Current password", with: @user.password
      end

      click_button 'Update'
      expect(page).to have_content "Email can't be blank"

    end
  end

  context "Destroy user"  do

    before(:each) do
      @user = FactoryBot.create(:user)
      sign_in @user
    end

    scenario "should be successful", :js => true do

      visit edit_user_registration_path

      accept_confirm do
        click_link 'Cancel my account'
      end

      expect(page).to have_content("Bye! Your account has been successfully cancelled. We hope to see you again soon.")

    end
  end



end
