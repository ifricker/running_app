json.array!(@user_routes) do |user_route|
  json.extract! user_route, :id, :distance, :starting_lat, :starting_lng, :name
  json.url user_route_url(user_route, format: :json)
end
