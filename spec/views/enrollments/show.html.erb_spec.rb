require 'spec_helper'

describe "enrollments/show" do
  before(:each) do
    @enrollment = assign(:enrollment, stub_model(Enrollment,
      :user_id => 1,
      :course_id => 2,
      :instructor => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/false/)
  end
end
