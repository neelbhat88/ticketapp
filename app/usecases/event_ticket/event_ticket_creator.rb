class EventTicket::EventTicketCreator

  def initialize
  end

  def create(args)
    event_id = args[:event_id]
    name = args[:name]
    description = args[:description]
    price = args[:price]

    event_ticket = EventTicket.new(event_id: event_id, name: name,
                                   description: description, price: price)
    event_ticket.save

    event_ticket
  end

end
