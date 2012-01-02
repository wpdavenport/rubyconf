class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :serial
      t.string :ticket_type
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :attendee_id
      t.string :company

      t.timestamps
    end
  end
end
