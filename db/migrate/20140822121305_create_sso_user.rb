class CreateSsoUser < ActiveRecord::Migration
  def change
    create_table :sso_users do |t|
      t.integer :user_id
      t.integer :partner_id
      t.string :sso_identifier

      t.timestamps
    end
  end
end
