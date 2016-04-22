class LocationController < ApplicationController

  def create
    lat = params[:location][:lat]
    long = params[:location][:lng]
    startpoint = Geokit::Geocoders::GoogleGeocoder.geocode("#{lat}, #{long}")
    puts startpoint
  end

end

