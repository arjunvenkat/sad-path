require 'spec_helper'

describe "course_check_lists/show" do
  before(:each) do
    @course_check_list = assign(:course_check_list, stub_model(CourseCheckList,
      :course_id => 1,
      :check_list_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
  end
end
