class Participation < ApplicationRecord
  belongs_to :user
  belongs_to :activity

  def participate
    current_user.participations.create (
      activity_id: params[:activity]
    )
  end
end
