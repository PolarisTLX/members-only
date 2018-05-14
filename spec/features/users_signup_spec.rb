require 'spec_helper'
require 'rails_helper'

RSpec.feature "User signs up", type: :feature do

  scenario "User signs up sucessfully" do
    visit "/signup"

    fill_in "Username", :with => "AnyName"
    fill_in "Password", :with => "password"
    fill_in "Password confirmation", :with => "password"

    click_button "Submit"

    # expect(response.response_code).to eql(302) # 302 is the HTTP code for a successful signup - DOES NOT WORK
    # response.should redirect_to '/users/*' - DOES NOT WORK
    expect(page).to have_text("Welcome to the Gossip App!")
  end

  scenario "User submits invalid info" do
    visit "/users/new"

    # No form fields filled in

    click_button "Submit"

    expect(page).to have_text("Username can't be blank")
    expect(page).to have_text("Password can't be blank")

  end

  scenario "User submits incorrect password confirmation" do
    visit "/users/new"

    # No form fields filled in
    fill_in "Username", :with => "AnyName"
    fill_in "Password", :with => "password"
    fill_in "Password confirmation", :with => "wrongmatch"

    click_button "Submit"

    expect(page).to have_text("Password confirmation doesn't match Password")

  end

end
