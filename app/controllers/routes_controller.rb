class RoutesController < ApplicationController
  before_action :set_routes
  before_action :set_route, only: [:show, :edit, :update, :destroy]

  # GET users/1/routes
  def index
    @routes = @user.routes
  end

  # GET users/1/routes/1
  def show
  end

  # GET users/1/routes/new
  def new
    @route = @user.routes.build
  end

  # GET users/1/routes/1/edit
  def edit
  end

  # POST users/1/routes
  def create
    if current_user
      route = Route.find_by(id: params[:route_id])
      puts "$" * 30
      puts params
      puts "$" * 30
      route.distance = params[:total_miles][1..-2]
      start = Waypoint.find_by(id: route.start_id)
      location = Geokit::Geocoders::GoogleGeocoder.geocode("#{start.latitude}, #{start.longitude}")
      route.name = location.formatted_address
      route.save
      current_user.routes << route
      # respond_to do |format|
      #   format.json { render :json => route }
      # end
      redirect_to(user_path(current_user), notice: 'Route was successfully saved.')
    end
  end

  # PUT users/1/routes/1
  def update
    if @route.update_attributes(route_params)
      redirect_to(user_path(current_user), notice: 'Route was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE users/1/routes/1
  def destroy
    @route.destroy

    redirect_to(user_path(current_user), notice: 'Route was successfully deleted.')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_routes
      @user = User.find(params[:user_id])
    end

    def set_route
      @route = @user.routes.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def route_params
      params.require(:route).permit(:distance, :starting_lat, :starting_lng, :name)
    end
end
