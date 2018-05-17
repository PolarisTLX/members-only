require 'rails_helper'
include SessionsHelper

RSpec.describe SessionsController, type: :controller do
  
  before do
    Rails.application.load_seed
  end

  let(:user) { User.find_by(username: 'user1') }

  context 'GET #new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  context 'POST #create' do
    context 'when user info is valid' do
      it 'logs in user and redirects to user page' do
        post :create, params: { session: { username: user.username, password: 'password' } }
        expect(logged_in?).to be true
        expect(response).to redirect_to(user)
      end
    end

    context 'when user info is NOT valid' do
      it 'does not log in user and re-renders login view' do
        post :create, params: { session: { username: user.username, password: 'wrongpassword' } }
        expect(logged_in?).to be false
        expect(request.path).to eq(login_path)
        expect(flash[:danger]).to eq 'Invalid email/password combination'
      end
    end
  end
end
