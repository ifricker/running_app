class AnonRoutesController < ApplicationController

  skip_before_action :verify_authenticity_token

  def create
    if params[:input_miles_decimal]
      params[:input_miles] = params[:input_miles] + "." + params[:input_miles_decimal]
    end

    route_test = CreateRoute.new(params)
    new_route = Route.new()

    start = route_test.get_start_location
    start.route = new_route
  
    new_route.start_id = start.id
    new_route.save
    start.save

    route_test.set_route_direction

    route_test.create_route_waypoints(new_route)

    new_route.map_url = route_test.make_map_url(new_route.waypoints)
    new_route.save

    respond_to do |format|
      format.json { render :json => new_route.waypoints }
    end
  end

end
