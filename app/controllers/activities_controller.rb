class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  load_and_authorize_resource
  # GET /activities
  # GET /activities.json
  def index
    if params[:location].present?
      @locations = Location.joins(:activities).near(params[:location], params[:distance], :units => :mi) #.where(['activities.next_at > ?', Time.now])

      @activities = []
      @locations.each do |location|
        @activities += location.activities
      end
    elsif params[:search].present?
      @activities = Activity.search(params[:search])
    else
      @activities = Activity.all #.where(['activities.next_at > ?', Time.now])
    end
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

  # def map_location
  #   if params[:location].present?
  #     @locations = Location.joins(:activities).near(params[:location], params[:distance]) #.where(['activities.next_at > ?', Time.now])
  #
  #     @activities = []
  #     @locations.each do |location|
  #       @activities += location.activities
  #     end
  #   else
  #     @activities = Activity.all #.where(['activities.next_at > ?', Time.now])
  #   end
  #   # @activity = Activity.find(params[:activity_id])
  #   @hash = Gmaps4rails.build_markers(@activities) do |activity, marker|
  #     marker.lat(activity.location.latitude)
  #     marker.lng(activity.location.longitude)
  #     marker.infowindow(
  #     "<strong>" + "Activity: " + "</strong>" + activity.name + "<br>" + "<strong>" + "Address: " + "</strong>" + activity.location.address + "<br>" + "<strong>" + "Description: " + "</strong>" + activity.description + "<br>" +
  #     "<strong>" + "When: " + "</strong>" + activity.next_at.strftime("%B %-d, %Y | %-l:%M%P") + "<br>" +
  #     "<strong>" + "Schedule: " + "</strong>" + activity.schedule + "<br>" + "<strong>" + "Website: " + "</strong>" + activity.website)
  #   end
  #   render json: @hash.to_json
  # end

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
      marker.lat(activity.location.latitude)
      marker.lng(activity.location.longitude)
      marker.infowindow("<strong>" + activity.name + "</strong><br><em>" + activity.location.address + "</em><br>")
    end
    render json: @hash.to_json
  end

  def profile

  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity
      @activity = Activity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def activity_params
      params.require(:activity).permit(:name, :user_id, :website, :description, :next_at, :location_id, :schedule, :requirement, :pricing, :fitness_level)
    end
end
