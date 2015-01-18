require 'rails_helper'

describe EventTicket::EventTicketCreator do

  before :all do
    @event_ticket_creator = EventTicket::EventTicketCreator.new()
  end

  it "should create an event ticket with supplied arguments" do
    length = EventTicket.all.length

    et = @event_ticket_creator.create(
      {event_id: 1, name: "Name", description: "Description", price: 14}
    )

    expect(EventTicket.all.length).to eq(length + 1)
    expect(et.event_id).to eq(1)
    expect(et.name).to eq("Name")
    expect(et.description).to eq("Description")
    expect(et.price).to eq(14)
  end

  it "should allow creating multiple event tickets for a given event" do
    @event_ticket_creator.create({event_id: 10, name: "EventTicket 1"})
    @event_ticket_creator.create({event_id: 10, name: "EventTicket 2"})

    expect(EventTicket.where(:event_id => 10).length).to eq(2)
  end

  it "should not allow two event tickets with the same name" do
    @event_ticket_creator.create({event_id: 10, name: "EventTicket 1"})
    et2 = @event_ticket_creator.create({event_id: 10, name: "EventTicket 1"})

    expect(EventTicket.where(:event_id => 10).length).to eq(1)
    expect(et2.errors.messages[:name]).to_not be_nil
  end

end
