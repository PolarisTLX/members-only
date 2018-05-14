require 'spec_helper'
require 'rails_helper'
include SessionsHelper

RSpec.feature "User login", :type => :feature do

  before {Rails.application.load_seed}

  # fixtures :users
  # This is our test made up database of users, file: fixtures users.yml file

#   scenario "User can login sucessfully" do
#     visit "/login"
#
#     fill_in "Username", :with => "Person1"
#     fill_in "Password", :with => "password"
#
#     click_button "Login"
#     # click_button "Submit"
#
#     expect(page).to have_text("Edit Your Profile")
#
#   end
#
#   scenario "User cannot login with incorrect password" do
#     visit "/login"
#
#     fill_in "Username", :with => "Person1"
#     fill_in "Password", :with => "wrongpass"
#
#     click_button "Login"
#     # click_button "Submit"
#
#     expect(page).to have_text("Invalid username/password combination
# ")
#
#   end

end
