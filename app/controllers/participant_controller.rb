class ParticipantController < ApplicationController

  def create
    current_user.participations.create(
      activity_id: params[:activity_id]
    )
    flash[:notice] = "You have successfully signed up to the activity!"
    redirect_to "/activities/#{params[:activity_id]}"
  end

  # def show_all_active_activities
  #   @all_active_activities = Activity.find(:all, : => {})
  #   @hash = Gmaps4rails.build_markers(@all_active_activities) do |activity, marker|
  #     marker.lat(activity.location.latitude)
  #     marker.lng(activity.location.longitude)
  #     marker.infowindow("<strong>" + activity.name + "</strong><br><em>" + activity.location.address + "</em><br>")
  #   end
  #   render json: @hash.to_json
  # end

  def destroy
    @participation = Participation.where('user_id = ? AND activity_id = ?', current_user.id, params[:activity_id]).first
    @participation.destroy
    flash[:notice] = "You have successfully removed your participation from this event!"
    redirect_to "/activities/#{params[:activity_id]}"
  end

end
