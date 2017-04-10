class Activity < ApplicationRecord
  belongs_to :location, optional: true
  belongs_to :user, optional: true
  has_many :participation

  def organizer_name
    if self.user.present?
      "#{self.user.name}"
    else
      "Unknown"
    end
  end
  def organizer_email
    if self.user.present?
      "#{self.user.email}"
    else
      "Unknown"
    end
  end
end
