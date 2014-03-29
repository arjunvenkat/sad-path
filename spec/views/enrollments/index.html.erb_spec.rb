require 'spec_helper'

describe "enrollments/index" do
  before(:each) do
    assign(:enrollments, [
      stub_model(Enrollment,
        :user_id => 1,
        :course_id => 2,
        :instructor => false
      ),
      stub_model(Enrollment,
        :user_id => 1,
        :course_id => 2,
        :instructor => false
      )
    ])
  end

  it "renders a list of enrollments" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
