require 'spec_helper'

describe "checks/index" do
  before(:each) do
    assign(:checks, [
      stub_model(Check,
        :description => "Description",
        :input_label => "Input Label",
        :input_example => "MyText"
      ),
      stub_model(Check,
        :description => "Description",
        :input_label => "Input Label",
        :input_example => "MyText"
      )
    ])
  end

  it "renders a list of checks" do
    render
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Input Label".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
