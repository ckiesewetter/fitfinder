class Location < ApplicationRecord
  geocoded_by :full_address
  # auto-fetch coordinates and the condition is for preventing fetching the same address more than once
  after_validation :geocode
  has_many :activities

  def full_address
    "#{address}, #{city}, #{state}, #{zip}"
  end
end
