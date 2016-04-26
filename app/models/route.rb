class Route < ActiveRecord::Base
  belongs_to :user
  has_many :waypoints

  acts_as_mappable  :default_units => :miles,
                    :distance_field_name => :distance,
                    :lat_column_name => :latitude,
                    :lng_column_name => :longitude


  def make_route(direction, distance)
    self.waypoints.last.endpoint(direction, distance)
  end
end
