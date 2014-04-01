json.array!(@check_list_items) do |check_list_item|
  json.extract! check_list_item, :id, :check_list_id, :check_id, :position
  json.url check_list_item_url(check_list_item, format: :json)
end
