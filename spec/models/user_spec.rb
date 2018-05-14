require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    Rails.application.load_seed
  end

  let(:user) { User.find_by(username: 'user1') }

  it "is valid with valid attributes" do
    expect(user).to be_valid
  end

  it "is not valid without a username" do
    user.username = nil
    expect(user).to_not be_valid
  end

  it "is not valid without an password digest" do
    user.password_digest = nil
    expect(user).to_not be_valid
  end
end
