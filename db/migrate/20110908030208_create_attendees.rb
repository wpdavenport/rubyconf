class CreateAttendees < ActiveRecord::Migration
  def change
    create_table :attendees do |t|
      t.integer :event_id
      t.string  :company
      t.string  :last_name
      t.string  :first_name
      t.string  :email
      t.string  :phone
      t.string  :billing_address
      t.string  :status
      t.string  :serial
      t.string  :price

      t.timestamps
    end
  end
end
