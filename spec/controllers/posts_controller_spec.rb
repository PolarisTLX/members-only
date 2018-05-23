require 'rails_helper'
include SessionsHelper

RSpec.describe PostsController, type: :controller do

  before do
    Rails.application.load_seed
  end

  let(:user) { User.find_by(username: 'user1') }

  context 'when user is logged in' do

    before { log_in(User.first) }

    describe 'GET #new' do
      it 'successfully shows the new post page' do
        get :new
        expect(response).to have_http_status(:success)
      end
    end

    describe 'POST #create' do
      context 'when new post info is valid' do
        it 'creates the new post' do
          expect{post :create, params: { post: { title: 'Major News!', body: 'You wont believe who just said blah blah', user_id: 1} }}.to change{Post.count}.by(1)
          expect(Post.first.title).to eq 'Major News!'
          expect(response).to redirect_to(root_url)
        end
      end

      context 'when new post info is NOT invalid' do
        it 'does NOT create a new post' do
          expect{post :create,
                       params: { post: { title: '',
                                         body: 'You wont believe who just said blah blah',
                                         user_id: 1 } }
          }.to change { Post.count }.by(0)
        end
      end
    end
  end

  context 'when user is not logged in' do

    describe 'GET #new' do
      it 'redirects to login page' do
        get :new
        expect(response).to redirect_to(login_url)
      end
    end

    describe 'POST #create' do
      it 'post is not created and user is redirected to login page' do
        expect{post :create,
                     params: { post: { title: 'Major News!',
                                       body: 'You wont believe who just said blah blah',
                                       user_id: 1 } }
        }.to change { Post.count }.by(0)
        expect(response).to redirect_to(login_url)
      end
    end

  end

end
