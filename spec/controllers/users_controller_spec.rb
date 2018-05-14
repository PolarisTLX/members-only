require 'rails_helper'
include SessionsHelper

RSpec.describe UsersController, type: :controller do

  before do
    Rails.application.load_seed
  end

  let(:user) { User.find_by(username: 'user1') }

  context "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end
  context "GET #show" do
    it "returns http success" do
      get :show, params: { id: 1 }
      expect(response).to have_http_status(:success)
    end
  end
  context "GET #edit" do
    context "when user tries to access the wrong profile" do
      it "redirects user to their own profile" do
        log_in(User.first)
        get :edit, params: { id: 2 } # "id: 2" is the wrong user
        expect(response).to redirect_to(User.first)
      end
    end

    context "when correct user accesses edit page" do
      it "returns http success" do
        log_in(User.first)
        get :edit, params: { id: 1 }
        expect(response).to have_http_status(:success)
      end
    end

  end

  # context "PATCH #update" do
  #   context "when user saves an edit to their profile" do
  #     it "properly saves the changes" do
  #       log_in(User.first)
  #       patch edit_user_path(User.first), params: { user: { username: 'NewName', password: 'password', password_confirmation: 'password' } }
  #       expect(User.first.username).to eq("NewName")
  #     end
  #   end
  # end


  context "POST #create" do

    context "when new user info is valid" do
      it "creates the new user, logs in the user, and redirects to user's page" do
        # post :create, params: { user: { username: 'Person10', password: 'password', password_confirmation: 'password' } }

        expect{post :create, params: { user: { username: 'Person10', password: 'password', password_confirmation: 'password' } }}.to change{User.count}.by(1)
        expect(logged_in?).to be true
        # expect(response).to redirect_to(user)
      end
    end

    context "when new user info is invalid" do
      # render_views
      it "does NOT create a new user and the page is re-rendered" do
        # pass words don't match
        expect{post :create, params: { user: { username: 'Person10', password: 'password', password_confirmation: 'word' } }}.to change{User.count}.by(0)
        expect(logged_in?).to be false
        # the same page gets re-rendered
        # expect(response).to render_template(:new)
      end
    end


  #
  #   context "when user info is NOT valid" do
  #     it "does not log in user and re-renders login view" do
  #       post :create, params: { session: { username: user.username, password: 'wrongpassword' } }
  #       expect(logged_in?).to be false
  #     end
  #   end
  end




end
