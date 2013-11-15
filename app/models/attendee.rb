class Attendee < ActiveRecord::Base
  
  has_many :tickets
                            
  self.per_page = 20

  scope :search, ->(term) { where(["LOWER(company) LIKE LOWER(?) OR LOWER(last_name) LIKE LOWER(?)", "%#{term}%", "%#{term}%"]) }
end
