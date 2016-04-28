class AnonRoutesController < ApplicationController
  DISTANCE_PER_LEG_PER_MILE = 0.166
  skip_before_action :verify_authenticity_token

  def create
    if params[:input_miles_decimal]
      params[:input_miles] = params[:input_miles] + "." + params[:input_miles_decimal]
    end

    if params[:waypoint]
      lat = params[:waypoint][:lat]
      lng = params[:waypoint][:lng]
    end
    new_route = Route.new()

    if (params[:start_location].empty? && !lat )
      location = Geokit::Geocoders::GoogleGeocoder.geocode("San Francisco, CA")
      start = Waypoint.create(latitude: location.lat, longitude: location.lng)
    elsif params[:start_location].empty?
      start = Waypoint.create(latitude: lat, longitude: lng)
    else
      location = Geokit::Geocoders::GoogleGeocoder.geocode(params[:start_location])
      start = Waypoint.create(latitude: location.lat, longitude: location.lng)
    end

    start.route = new_route
    new_route.start_id = start.id
    new_route.save
    start.save

    start_direction = rand(0...360)
    turn_direction = [1,2].sample
    input_miles = find_units(params)

    distance = DISTANCE_PER_LEG_PER_MILE * input_miles

    create_route_waypoints(new_route, start_direction, distance, turn_direction)

    new_route.map_url = map_url(new_route.waypoints)
    new_route.save

    respond_to do |format|
      format.json { render :json => new_route.waypoints }
    end
  end


  private

  def miles_to_km(miles)
    miles * 1.60934
  end

  def km_to_miles(kms)
    kms * 0.621371
  end

  def map_url(waypoints)
    "https://www.google.com/maps?saddr=#{waypoints.first.latitude},+#{waypoints.first.longitude}&daddr=#{waypoints[1].latitude},+#{waypoints[1].longitude}+to:#{waypoints[2].latitude},+#{waypoints[2].longitude}+to:#{waypoints[3].latitude},+#{waypoints[3].longitude}+to:#{waypoints.first.latitude},+#{waypoints.first.longitude}&dirflg=w"
  end

  def find_units(params)
    if params[:units] == "km"
      km_to_miles(params[:input_miles].to_f)
    else
      params[:input_miles].to_f
    end
  end

  def create_route_waypoints(route, start_direction, distance, turn_direction)
    wp1 = route.make_route(start_direction, distance)
    if turn_direction == 1
        wp2 = route.make_route(start_direction - 90, distance)
        wp3 = route.make_route(start_direction - 180, distance)
    else
        wp2 = route.make_route(start_direction + 90, distance)
        wp3 = route.make_route(start_direction + 180, distance)
    end
    route.waypoints << Waypoint.create(latitude: wp1.lat, longitude: wp1.lng)
    route.waypoints << Waypoint.create(latitude: wp2.lat, longitude: wp2.lng)
    route.waypoints << Waypoint.create(latitude: wp3.lat, longitude: wp3.lng)
  end

end
