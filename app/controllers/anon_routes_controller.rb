class AnonRoutesController < ApplicationController

  def create
    lat = params[:waypoint][:lat]
    lng = params[:waypoint][:lng]
    # latlng = lat.to_s + ", " + lng.to_s
    # puts latlng
    new_route = Route.new()
    start = Waypoint.create(latitude: lat, longitude: lng)
    start.route = new_route
    start.save
    new_route.start_id = start.id
    new_route.save
    wp1 = new_route.go_north(0.77)
    new_route.waypoints << Waypoint.create(latitude: wp1.lat, longitude: wp1.lng)
    wp2 = new_route.go_east(0.77)
    new_route.waypoints << Waypoint.create(latitude: wp2.lat, longitude: wp2.lng)
    wp3 = new_route.go_south(0.77)
    new_route.waypoints << Waypoint.create(latitude: wp3.lat, longitude: wp3.lng)

    respond_to do |format|
      format.json { render :json => new_route.waypoints }
    end
  end

end
