json.extract! local_station, :id, :line, :station, :distance, :created_at, :updated_at
json.url local_station_url(local_station, format: :json)
