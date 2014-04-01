require 'spec_helper'

describe "course_check_lists/edit" do
  before(:each) do
    @course_check_list = assign(:course_check_list, stub_model(CourseCheckList,
      :course_id => 1,
      :check_list_id => 1
    ))
  end

  it "renders the edit course_check_list form" do
    render

    assert_select "form[action=?][method=?]", course_check_list_path(@course_check_list), "post" do
      assert_select "input#course_check_list_course_id[name=?]", "course_check_list[course_id]"
      assert_select "input#course_check_list_check_list_id[name=?]", "course_check_list[check_list_id]"
    end
  end
end
