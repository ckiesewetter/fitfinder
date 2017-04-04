class Activity < ApplicationRecord
  belongs_to :location, optional: true
  belongs_to :user, optional: true

  def organizer_name
    if self.user.present?
      "#{self.user.name}"  
    else
      "Unknown"
    end
  end
end
