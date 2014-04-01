require 'spec_helper'

describe "course_check_lists/index" do
  before(:each) do
    assign(:course_check_lists, [
      stub_model(CourseCheckList,
        :course_id => 1,
        :check_list_id => 2
      ),
      stub_model(CourseCheckList,
        :course_id => 1,
        :check_list_id => 2
      )
    ])
  end

  it "renders a list of course_check_lists" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
