require 'rails_helper'

describe User do

  let(:user) { User.new }

  it "should have an email" do
    expect(user).to respond_to(:email)
  end

  it "should have a first_name" do
    expect(user).to respond_to(:first_name)
  end

  it "should have an last_name" do
    expect(user).to respond_to(:last_name)
  end

  describe "is invalid" do
    it "if email not provided" do
      expect(User.new()).to have(1).errors_on(:email)
    end

    it "if first_name not provided" do
      expect(User.new()).to have(1).errors_on(:first_name)
    end

    it "if last_name not provided" do
      expect(User.new()).to have(1).errors_on(:last_name)
    end

    it "if email already exists" do
      user = User.create(email: "test@email.com", password:"test",
                          first_name: "Test", last_name: "Test")

      expect(User.new(email: user.email, password: "test",
                      first_name: "Hello", last_name: "World")).to have(1).errors_on(:email)
    end
  end
end
