json.array!(@roadblock_checks) do |roadblock_check|
  json.extract! roadblock_check, :id, :check_id, :roadblock_id, :completed_at, :solved_it
  json.url roadblock_check_url(roadblock_check, format: :json)
end
