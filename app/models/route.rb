class Route < ActiveRecord::Base
  belongs_to :user
  has_many :waypoints

  acts_as_mappable  :default_units => :miles,
                    :distance_field_name => :distance,
                    :lat_column_name => :latitude,
                    :lng_column_name => :longitude

  def go_north(distance)
    self.waypoint.last.endpoint(0 , distance)
  end

  def go_south(distance)
    self.waypoint.last.endpoint(180 , distance)
  end

  def go_east(distance)
    self.waypoint.last.endpoint(90 , distance)
  end

  def go_west(distance)
    self.waypoint.last.endpoint(-90 , distance)
  end
end
