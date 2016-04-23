class LocationController < ApplicationController

  def create
    lat = params[:location][:lat]
    long = params[:location][:lng]
    startpoint = Geokit::Geocoders::GoogleGeocoder.geocode("#{lat}, #{long}")
    puts startpoint.ll
    puts "__________________________"
    north = go_north(startpoint, 1)
    puts north
    puts "__________________________"
    east = go_east(north, 1)
    puts east
    puts "__________________________"
    south = go_south(east, 1)
    puts south
    puts "__________________________"
    west = go_west(south, 1)
    puts west

  end




  private

  def go_north(startpoint, distance)
    startpoint.endpoint(0 , distance)
  end

  def go_south(startpoint, distance)
    startpoint.endpoint(180 , distance)
  end

  def go_east(startpoint, distance)
    startpoint.endpoint(90 , distance)
  end

  def go_west(startpoint, distance)
    startpoint.endpoint(-90 , distance)
  end


end

