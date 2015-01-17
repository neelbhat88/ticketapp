require 'rails_helper'

describe Event::EventCreator do
  describe "should be able to create an Event given" do

    it "a name, description and date" do
      length = Event.all.length

      date = DateTime.now
      event = Event::EventCreator.new().create(
              {:name => "Event",
               :description => "Description",
               :date => date})

      expect(Event.all.length).to eq(length + 1)
      expect(event.name).to eq("Event")
      expect(event.description).to eq("Description")
      expect(event.date).to eq(date)
    end

  end
  
end
