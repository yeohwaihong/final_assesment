require 'rails_helper'

RSpec.describe User, :type => :model do
  it "is valid with valid attributes" do
    expect(User.new(name: "Test", email: "testing123@test.com", password: "test")).to be_valid
  end

  it "is not valid without a name" do
  expect(User.new(name: nil)).to_not be_valid
  end

  it "is not valid without an email" do
  expect(User.new(email: nil)).to_not be_valid
  end

  it "is not valid without password" do
  expect(User.new(password: nil)).to_not be_valid
  end

  it "user should be user" do
    user = User.new
    user.set_default_role
    expect(user.role).to eq("user")
  end

end
