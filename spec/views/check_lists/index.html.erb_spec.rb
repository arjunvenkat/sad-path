require 'spec_helper'

describe "check_lists/index" do
  before(:each) do
    assign(:check_lists, [
      stub_model(CheckList,
        :name => "Name"
      ),
      stub_model(CheckList,
        :name => "Name"
      )
    ])
  end

  it "renders a list of check_lists" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
