require 'rails_helper'

RSpec.describe Post, type: :model do

  before do
    Rails.application.load_seed
  end

  let(:post) { Post.find_by(title: 'This is a title') }

  it "is valid with valid attributes" do
    expect(post).to be_valid
  end

  it "is not valid without a title" do
    post.title = nil
    expect(post).to_not be_valid
  end

  it "is not valid without a body" do
    post.body = nil
    expect(post).to_not be_valid
  end

  it "is not valid without a user_id " do
    post.user_id = nil
    expect(post).to_not be_valid
  end
end
