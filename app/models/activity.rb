class Activity < ApplicationRecord
  belongs_to :location, optional: true
end
