class Activity < ApplicationRecord
  geocoded_by :address
  belongs_to :location, optional: true
  after_validation :geocode
  belongs_to :user, optional: true
end
