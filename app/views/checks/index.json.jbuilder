json.array!(@checks) do |check|
  json.extract! check, :id, :description, :input_label, :input_example
  json.url check_url(check, format: :json)
end
