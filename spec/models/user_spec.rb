require 'rails_helper'

RSpec.describe User, type: :model do

  fixtures :users
  subject { users(:UserOne) }
  # ":UserOne" is from the fixtures users.yml file

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a username" do
    subject.username = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without an password digest" do
    subject.password_digest = nil
    expect(subject).to_not be_valid
  end
end
