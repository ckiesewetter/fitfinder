class ParticipantController < ApplicationController

  def create
    current_user.participations.create(
      activity_id: params[:activity_id]
    )
    flash[:notice] = "You have successfully signed up to the activity!"
    # redirect_to "/activities/#{params[:activity_id]}"
  end

end
