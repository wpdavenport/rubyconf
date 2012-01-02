class AddRememberableToUsers < ActiveRecord::Migration
  def change
    change_table(:users) do |t|
      t.rememberable
    end
  end
end
