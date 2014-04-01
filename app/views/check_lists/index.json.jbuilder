json.array!(@check_lists) do |check_list|
  json.extract! check_list, :id, :name
  json.url check_list_url(check_list, format: :json)
end
