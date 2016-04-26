class AnonRoutesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create

    if params[:waypoint]
      lat = params[:waypoint][:lat]
      lng = params[:waypoint][:lng]
    end
    new_route = Route.new()

    if (params[:start_location].empty? && !lat )
      location = Geokit::Geocoders::GoogleGeocoder.geocode("Balboa Park, San Diego, CA")
      start = Waypoint.create(latitude: location.lat, longitude: location.lng)
    elsif params[:start_location].empty?
      start = Waypoint.create(latitude: lat, longitude: lng)
    else
      location = Geokit::Geocoders::GoogleGeocoder.geocode(params[:start_location])
      start = Waypoint.create(latitude: location.lat, longitude: location.lng)
    end
    start.route = new_route
    start_direction = rand(0...360)
    turn_direction = [1,2].sample
    start.save
    if params[:units] == "km"
        input_miles = km_to_miles(params[:input_miles].to_f)
    else
        input_miles = params[:input_miles].to_f
    end
    distance = 0.166 * input_miles
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

    url = "https://www.google.com/maps?saddr=#{start.latitude},+#{start.longitude}&daddr=#{wp1.latitude},+#{wp1.longitude}+to:#{wp2.latitude},+#{wp2.longitude}+to:#{wp3.latitude},+#{wp3.longitude}+to:#{start.latitude},+#{start.longitude}&dirflg=w"
    puts url

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

end
