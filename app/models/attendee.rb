class Attendee < ActiveRecord::Base
  
  has_many :tickets
                            
  self.per_page = 20

  # scope :search, -> { where(["UPPER(company) LIKE ? OR UPPER(last_name) LIKE ?", "%#{term}%", "%#{term}%"]) }
  scope :search, -> { { conditions: ["UPPER(company) LIKE ? OR UPPER(last_name) LIKE ?", "%#{term}%", "%#{term}%"]  } }
end
