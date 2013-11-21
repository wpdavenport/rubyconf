class Ticket < ActiveRecord::Base

  belongs_to :attendee

  self.per_page = 20
  
  # scope :registered, :conditions => "registered_at IS NOT NULL"
  scope :registered, -> { where("registered_at IS NOT NULL")}
  scope :search, ->(term) { where(["LOWER(serial) LIKE LOWER(?) OR LOWER(last_name) LIKE LOWER(?) OR LOWER(email) LIKE LOWER(?) OR LOWER(swapped_with) LIKE LOWER(?)", "%#{term}%", "%#{term}%", "%#{term}%", "%#{term}%"]) }

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
