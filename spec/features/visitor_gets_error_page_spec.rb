require 'rails_helper'


RSpec.feature "Error feature", :type => :feature do

  context "No page found spec" do
    scenario "should respond with a 404 page"do

      visit '/foo'


      expect(page).to have_http_status(404)
      expect(page).to have_content("Ups! 404 Error")

    end
  end


end
