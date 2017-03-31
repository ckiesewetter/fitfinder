class Location < ApplicationRecord
  has_many :activities
  geocoded_by :address
  after_validation :geocode

end
