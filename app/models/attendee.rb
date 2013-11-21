class Attendee < ActiveRecord::Base
  
  has_many :tickets
                            
  self.per_page = 20

  scope :search, ->(term) { where(["LOWER(company) LIKE LOWER(?)", "%#{term}%"]) }
end
