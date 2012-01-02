class AddSwappedTicketsToUser < ActiveRecord::Migration
  def change
    add_column :tickets, :swapped_with, :string
    add_column :tickets, :swapped_email, :string
  end
end
