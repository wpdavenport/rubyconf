class SsoUser < ActiveRecord::Base
  # attr_accessible :sso_identifier, :partner_id, :user_id
  
  belongs_to :user
  belongs_to :partner
end
