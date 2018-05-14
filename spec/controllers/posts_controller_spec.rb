require 'rails_helper'
include SessionsHelper

RSpec.describe PostsController, type: :controller do

  before do
    Rails.application.load_seed
  end

  let(:user) { User.find_by(username: 'user1') }

  context "GET #new" do
    context "when user is logged in but tries access new post page" do
      it "successfully shows the new post page" do
        log_in(User.first)
        get :new
        expect(response).to have_http_status(:success)
      end
    end

    context "when user is NOT logged in but tries access new post page" do
      it "redirects to login page" do
        # not logged in
        get :new
        expect(response).to redirect_to(login_url)
      end
    end

  end

  context "POST #create" do

    context "when new post info is valid" do
      it "creates the new post" do
        log_in(User.first)
        expect{post :create, params: { post: { title: 'Major News!', body: 'You wont believe who just said blah blah', user_id: 1} }}.to change{Post.count}.by(1)
        expect(response).to redirect_to(root_url)
      end
    end

    context "when new post info is NOT invalid" do
      it "does NOT create a new post" do
        log_in(User.first)
        # no title is provided
        expect{post :create, params: { post: { title: '', body: 'You wont believe who just said blah blah', user_id: 1} }}.to change{Post.count}.by(0)
      end
    end

    context "when user is not logged in" do
      it "post is not created and user is redirected to login page" do
        # log_in(User.first)
        expect{post :create, params: { post: { title: 'Major News!', body: 'You wont believe who just said blah blah', user_id: 1} }}.to change{Post.count}.by(0)
        expect(response).to redirect_to(login_url)
      end
    end
  end

end
