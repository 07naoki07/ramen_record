Geocoder.configure(
  timeout: 5,
  lookup: :google,
  api_key: ENV['GOOGLE_MAP_API'],
  units: :km,
)