class Attendee < ActiveRecord::Base
  
  has_many :tickets
                            
  self.per_page = 20

  scope :search, ->(term) { where(["UPPER(company) LIKE '#{term}' OR UPPER(last_name) LIKE '#{term}'"]) }
end
