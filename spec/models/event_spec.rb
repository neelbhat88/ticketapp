require 'rails_helper'

describe Event do
  let(:event) { Event.new }

  it "should have a name" do
    expect(event).to respond_to(:name)
  end

  it "should have a description" do
    expect(event).to respond_to(:description)
  end

  it "should have a date" do
    expect(event).to respond_to(:date)
  end

  describe "is invalid" do
    it "without a name" do
      expect(Event.new(name: nil)).to have(1).errors_on(:name)
    end
  end
end
