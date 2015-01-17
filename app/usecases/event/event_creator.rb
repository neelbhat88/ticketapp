class Event::EventCreator

  def initialize()
  end

  def create(args)
    name = args[:name]
    description = args[:description]
    date = args[:date]

    event = Event.new(:name => name, :description => description, :date => date)
    event.save

    event
  end
end
