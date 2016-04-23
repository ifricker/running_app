class Waypoint < ActiveRecord::Base
	belongs_to :route

  acts_as_mappable  :default_units => :miles,
                    :distance_field_name => :distance,
                    :lat_column_name => :latitude,
                    :lng_column_name => :longitude

end
