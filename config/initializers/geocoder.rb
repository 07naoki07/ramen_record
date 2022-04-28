Geocoder.configure(
  timeout: 5,
  lookup: :google,
  api_key: Rails.application.credentials.google_map_api_key,
  units: :km,
)