json.extract! device_configuration, :id, :name, :location, :module_type, :created_at, :updated_at
json.url device_configuration_url(device_configuration, format: :json)
