class WaypointController < ApplicationController

  def create
    lat = params[:location][:lat]
    long = params[:location][:lng]
    @waypoint = Geokit::Geocoders::GoogleGeocoder.geocode("#{lat}, #{long}")
  end




end

