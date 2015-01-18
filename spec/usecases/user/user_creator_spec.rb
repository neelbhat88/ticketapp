require 'rails_helper'

describe User::UserCreator do

  before :all do
    @user_creator = User::UserCreator.new()
  end

  it "should create a user with the given args" do
    length = User.all.length

    user = @user_creator.create({ email: "test@email.com",
                           first_name: "First",
                           last_name: "Last" })

    expect(User.all.length).to eq(length+1)
    expect(user.email).to eq("test@email.com")
    expect(user.first_name).to eq("First")
    expect(user.last_name).to eq("Last")
  end

end
