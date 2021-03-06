class EventTicket < ActiveRecord::Base
  attr_accessible :description, :event_id, :name, :price

  validates :name, presence: true, uniqueness: true
  validates :event_id, presence: true
end
