require 'spec_helper'
require 'rails_helper'

RSpec.feature "User edits info", :type => :feature do

  # scenario "User edits username sucessfully" do
  #   visit "/users/1/edit"
  #
  #   log_in(user)
  #   fill_in "Username", :with => "Person10"
  #
  #   click_button "Submit"
  #
  #   expect(page).to have_text("Profile updated")
  # end
  #
  # scenario "User edits username and password sucessfully" do
  #   visit "/users/1/edit"
  #
  #   fill_in "Username", :with => "Person10"
  #   fill_in "Password", :with => "password"
  #   fill_in "Password confirmation", :with => "password"
  #
  #   click_button "Submit"
  #
  #   expect(page).to have_text("Profile updated")
  # end

  # scenario "User submits invalid info" do
  #   visit "/users/1/edit"
  #
  #   # No form fields filled in
  #
  #   click_button "Submit"
  #
  #   expect(page).to have_text("Password can't be blank")
  #
  # end
  #
  # scenario "User submits invalid info" do
  #   visit "/users/1/edit"
  #
  #   fill_in "Username", :with => ""
  #   fill_in "Email", :with => ""
  #   fill_in "Password", :with => "password"
  #
  #
  #   click_button "Submit"
  #
  #   expect(page).to have_text("Username can't be blank")
  #   expect(page).to have_text("Email can't be blank")
  #
  # end

end
