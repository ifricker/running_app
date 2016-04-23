class AnonRoutesController < ApplicationController

  def create
    puts "got to anon routes controller"
    lat = params[:location][:lat]
    lng = params[:location][:lng]
    @new_route = Route.new()
    @start = Waypoint.create(latitude: lat, longitude: lng)
    @start.route = @new_route
    @start.save

    @new_route

  end


end
