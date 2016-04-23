class LocationController < ApplicationController

  def create
    lat = params[:location][:lat]
    long = params[:location][:lng]
    @startpoint = Geokit::Geocoders::GoogleGeocoder.geocode("#{lat}, #{long}")
    puts @startpoint.ll
    puts "__________________________"
    @north = @startpoint.go_north(1)
    puts @north
    puts "__________________________"
    @east = @north.go_east(1)
    puts @east
    puts "__________________________"
    @south = @east.go_south(1)
    puts @south
    puts "__________________________"
    @west = @south.go_west(1)
    puts @west

  end


end

