class Attendee < ActiveRecord::Base
  
  has_many :tickets
  
  self.per_page = 20

  scope :search, lambda { |term| where(["UPPER(company) LIKE ? OR UPPER(last_name) LIKE ?", "%#{term}%", "%#{term}%"]) }

end
