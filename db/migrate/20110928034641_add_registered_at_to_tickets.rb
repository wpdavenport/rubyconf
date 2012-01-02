class AddRegisteredAtToTickets < ActiveRecord::Migration

  def change
    add_column :tickets, :registered_at, :datetime
  end

end
