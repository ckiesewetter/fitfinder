class Location < ApplicationRecord
  geocoded_by :address
  # auto-fetch coordinates and the condition is for preventing fetching the same address more than once
  after_validation :geocode
  has_many :activities
end
