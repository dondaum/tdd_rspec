require "rails_helper"

RSpec.feature "Visitor register", :type => :feature do
   scenario "Visitor visit root path and register at the app" do

     visit root_path
     click_link('Registrieren')
     expect(page).to have_content('Sign in')
   end


end
