class CreateEventTickets < ActiveRecord::Migration
  def change
    create_table :event_tickets do |t|
      t.string :name
      t.string :description
      t.decimal :price, :default => 0
      t.integer :event_id

      t.timestamps
    end

    add_index(:event_tickets, :event_id)
  end
end
