class Activity < ApplicationRecord
  geocoded_by :address
  after_validation :geocode
  belongs_to :user
end
