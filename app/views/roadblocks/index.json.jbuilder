json.array!(@roadblocks) do |roadblock|
  json.extract! roadblock, :id, :error_message, :code_snippet, :description, :solution, :user1_id, :user2_id
  json.url roadblock_url(roadblock, format: :json)
end
