class AnonRoutesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    lat = params[:waypoint][:lat]
    lng = params[:waypoint][:lng]
    puts "_________________" * 5
    puts params
    puts "_________________" * 5
    new_route = Route.new()
    start = Waypoint.create(latitude: lat, longitude: lng)
    start.route = new_route
    start_direction = rand(0...360)
    turn_direction = [1,2].sample
    start.save
    new_route.start_id = start.id
    new_route.save
    distance = 0.166 * params[:input_miles].to_f
    wp1 = new_route.make_route(start_direction, distance)
    if turn_direction == 1
        wp2 = new_route.make_route(start_direction - 90, distance)
        wp3 = new_route.make_route(start_direction - 180, distance)
    else
        wp2 = new_route.make_route(start_direction + 90, distance)
        wp3 = new_route.make_route(start_direction + 180, distance)
    end
    new_route.waypoints << Waypoint.create(latitude: wp1.lat, longitude: wp1.lng)
    new_route.waypoints << Waypoint.create(latitude: wp2.lat, longitude: wp2.lng)
    new_route.waypoints << Waypoint.create(latitude: wp3.lat, longitude: wp3.lng)

    respond_to do |format|
      format.json { render :json => new_route.waypoints }
    end
  end


  # private

  # def route_params
  #     params.permit(:waypoint, :input_miles, :units)
  # end

end
