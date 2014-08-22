class CreatePartners < ActiveRecord::Migration
  def change
    create_table :partners do |t|
      t.string :private_key
      t.boolean :sso_enabled

      t.timestamps
    end
  end
end
