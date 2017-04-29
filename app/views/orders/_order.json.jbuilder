json.extract! order, :id, :date, :time, :from_adress, :to_adress, :passangers_count, :lenght_of_the_route, :driver_id, :rate_id, :created_at, :updated_at
json.url order_url(order, format: :json)
