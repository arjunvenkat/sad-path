require 'spec_helper'

describe "enrollments/new" do
  before(:each) do
    assign(:enrollment, stub_model(Enrollment,
      :user_id => 1,
      :course_id => 1,
      :instructor => false
    ).as_new_record)
  end

  it "renders new enrollment form" do
    render

    assert_select "form[action=?][method=?]", enrollments_path, "post" do
      assert_select "input#enrollment_user_id[name=?]", "enrollment[user_id]"
      assert_select "input#enrollment_course_id[name=?]", "enrollment[course_id]"
      assert_select "input#enrollment_instructor[name=?]", "enrollment[instructor]"
    end
  end
end
