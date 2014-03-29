require 'spec_helper'

describe "enrollments/edit" do
  before(:each) do
    @enrollment = assign(:enrollment, stub_model(Enrollment,
      :user_id => 1,
      :course_id => 1,
      :instructor => false
    ))
  end

  it "renders the edit enrollment form" do
    render

    assert_select "form[action=?][method=?]", enrollment_path(@enrollment), "post" do
      assert_select "input#enrollment_user_id[name=?]", "enrollment[user_id]"
      assert_select "input#enrollment_course_id[name=?]", "enrollment[course_id]"
      assert_select "input#enrollment_instructor[name=?]", "enrollment[instructor]"
    end
  end
end
