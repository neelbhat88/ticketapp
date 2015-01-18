class Event::EventCreator

  def initialize(event_klass=Event)
    @event_klass = event_klass
  end

  def create(args)
    name = args[:name]
    description = args[:description]
    date = args[:date]

    event = @event_klass.new(:name => name, :description => description, :date => date)
    event.save

    event
  end
end
