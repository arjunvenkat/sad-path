json.array!(@course_check_lists) do |course_check_list|
  json.extract! course_check_list, :id, :course_id, :check_list_id
  json.url course_check_list_url(course_check_list, format: :json)
end
