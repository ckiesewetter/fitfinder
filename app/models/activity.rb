class Activity < ApplicationRecord
  belongs_to :location, optional: false
  belongs_to :user, optional: true
  has_many :participation
  validates :terms_of_service, acceptance: true
  validates :location, presence: true

  accepts_nested_attributes_for :location, reject_if: :all_blank

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
