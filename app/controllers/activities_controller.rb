class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /activities
  # GET /activities.json
  def index
    @activities = Activity.all
  end

  # GET /activities/1
  # GET /activities/1.json
  def show
  end

  # GET /activities/new
  def new
    @activity = Activity.new
  end

  # GET /activities/1/edit
  def edit
  end

  # POST /activities
  # POST /activities.json
  def create
    @activity = Activity.new(activity_params)

    respond_to do |format|
      if @activity.save
        format.html { redirect_to @activity, notice: 'Activity was successfully created.' }
        format.json { render :show, status: :created, location: @activity }
      else
        format.html { render :new }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  def map_location
    # @activity = Activity.find(params[:activity_id])
    @hash = Gmaps4rails.build_markers(Activity.all) do |activity, marker|
      marker.lat(activity.latitude)
      marker.lng(activity.longitude)
      marker.infowindow("<em>" + activity.address + "</em>")
    end
    render json: @hash.to_json
  end

  # PATCH/PUT /activities/1
  # PATCH/PUT /activities/1.json
  def update
    respond_to do |format|
      if @activity.update(activity_params)
        format.html { redirect_to @activity, notice: 'Activity was successfully updated.' }
        format.json { render :show, status: :ok, location: @activity }
      else
        format.html { render :edit }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activities/1
  # DELETE /activities/1.json
  def destroy
    @activity.destroy
    respond_to do |format|
      format.html { redirect_to activities_url, notice: 'Activity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # This is a method to list all activities for the index map
  def show_all_activities
    @all_activities = Activity.all
    @hash = Gmaps4rails.build_markers(@all_activities) do |activity, marker|
      marker.lat(activity.latitude)
      marker.lng(activity.longitude)
      marker.infowindow("<strong>" + activity.name + "</strong><br><em>" + activity.address + "</em><br>")
    end
    render json: @hash.to_json
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity
      @activity = Activity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def activity_params
      params.require(:activity).permit(:name, :user_id, :website, :description, :next_at, :location_id, :schedule)
    end
end
