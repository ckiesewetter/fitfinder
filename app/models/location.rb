class Location < ApplicationRecord
  geocoded_by :full_address
  # auto-fetch coordinates and the condition is for preventing fetching the same address more than once
  after_validation :geocode
  has_many :activities

  has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }

  validates_attachment :image,
    content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] },
    size: { in: 0..10.megabytes }

  def full_address
    "#{address}, #{city}, #{state}, #{zip}"
  end

end
