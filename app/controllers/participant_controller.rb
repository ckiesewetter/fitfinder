class ParticipantController < ApplicationController

  def create
    current_user.participations.create(
      activity_id: params[:activity_id]
    )
    flash[:notice] = "You have successfully signed up to the activity!"
    redirect_to "/activities/#{params[:activity_id]}"
  end

  def destroy
    # snags the participation item from the participations database
    @participation = Participation.find_by(user_id: current_user.id, activity_id: params[:activity_id])
    # destroys the participation
    @participation.destroy
    flash[:notice] = "You have successfully been removed from this activity."
    redirect_to "/activities"
  end

end
