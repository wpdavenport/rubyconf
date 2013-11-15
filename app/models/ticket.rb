class Ticket < ActiveRecord::Base

  belongs_to :attendee

  self.per_page = 20
  
  # scope :registered, :conditions => "registered_at IS NOT NULL"
  scope :registered, -> { where("registered_at IS NOT NULL")}
  scope :search, ->(term) { where(["UPPER(serial) LIKE LOWER(?) OR UPPER(last_name) LIKE LOWER(?) OR UPPER(email) LIKE LOWER(?) OR UPPER(swapped_with) LIKE LOWER(?)", "%#{term}%", "%#{term}%", "%#{term}%", "%#{term}%"]) }

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
