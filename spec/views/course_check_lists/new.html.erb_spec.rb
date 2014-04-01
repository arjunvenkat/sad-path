require 'spec_helper'

describe "course_check_lists/new" do
  before(:each) do
    assign(:course_check_list, stub_model(CourseCheckList,
      :course_id => 1,
      :check_list_id => 1
    ).as_new_record)
  end

  it "renders new course_check_list form" do
    render

    assert_select "form[action=?][method=?]", course_check_lists_path, "post" do
      assert_select "input#course_check_list_course_id[name=?]", "course_check_list[course_id]"
      assert_select "input#course_check_list_check_list_id[name=?]", "course_check_list[check_list_id]"
    end
  end
end
