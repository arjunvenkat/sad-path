json.array!(@comments) do |comment|
  json.extract! comment, :id, :user_id, :roadblock_id, :contents
  json.url comment_url(comment, format: :json)
end
