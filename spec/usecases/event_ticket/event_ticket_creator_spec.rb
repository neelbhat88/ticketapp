require 'rails_helper'

describe EventTicket::EventTicketCreator do

  describe "should be able to create an event" do

    it "#create: given event_id, name, description and a price" do
      length = EventTicket.all.length

      et = EventTicket::EventTicketCreator.new().create(
        {event_id: 1, name: "Name", description: "Description", price: 14}
      )

      expect(EventTicket.all.length).to eq(length + 1)
      expect(et.event_id).to eq(1)
      expect(et.name).to eq("Name")
      expect(et.description).to eq("Description")
      expect(et.price).to eq(14)
    end

  end

end
