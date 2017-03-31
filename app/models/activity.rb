class Activity < ApplicationRecord
  belongs_to :location, optional: true
  belongs_to :user, optional: true
end
