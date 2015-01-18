class EventTicket::EventTicketCreator

  def initialize(event_ticket_klass=EventTicket)
    @event_ticket_klass = event_ticket_klass
  end

  def create(args)
    event_id = args[:event_id]
    name = args[:name]
    description = args[:description]
    price = args[:price]

    event_ticket = @event_ticket_klass.new(event_id: event_id, name: name,
                                           description: description, price: price)

    if @event_ticket_klass.where(name: name).length > 0
      event_ticket.errors.messages[:name] = "Event ticket with the same name already exists"
    else
      event_ticket.save
    end

    event_ticket
  end

end
