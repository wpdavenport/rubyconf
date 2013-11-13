class Ticket < ActiveRecord::Base

  belongs_to :attendee

  self.per_page = 20
  
  # scope :registered, :conditions => "registered_at IS NOT NULL"
  scope :registered, -> { where("registered_at IS NOT NULL")}
  scope :search, ->(term) { where(["UPPER(serial) LIKE '#{term}' OR UPPER(last_name) LIKE '#{term}' OR UPPER(email) LIKE '#{term}' OR UPPER(swapped_with) LIKE '#{term}'"]) }

  def registered?
    registered_at.present?
  end

  def register!
    update_attribute(:registered_at, Time.now)
  end
  
  def fullname
    first_name + " " + last_name
  end

end
