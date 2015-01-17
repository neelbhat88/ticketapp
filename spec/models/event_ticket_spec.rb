require 'rails_helper'

describe EventTicket do

  let(:event_ticket) { EventTicket.new }

  it "should have a event_id" do
    expect(event_ticket).to respond_to(:event_id)
  end

  it "should have a name" do
    expect(event_ticket).to respond_to(:name)
  end

  it "should have a description" do
    expect(event_ticket).to respond_to(:description)
  end

  it "should have a price" do
    expect(event_ticket).to respond_to(:price)
  end

  it "defaults price to 0 if not set" do
    expect(event_ticket.price).to eq(0)
  end

  describe "is invalid" do

    it "without an event_id" do
      expect(EventTicket.new(event_id: nil, name: "hello")).to have(1).errors_on(:event_id)
    end

    it "without a name" do
      expect(EventTicket.new(event_id: 1, name: nil)).to have(1).errors_on(:name)
    end

  end

end
