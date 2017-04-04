class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # reference to activities
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  has_many :activities
  # provides support for paperclip for the user avatar.
  has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }
  # This validation requres that Users attach an avatar photo upon creation.
  validates_attachment :image,
    content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] },
    size: { in: 0..10.megabytes }

  def name
    "#{self.first_name} #{self.last_name}"
  end
end
