require 'spec_helper'

describe "check_list_items/index" do
  before(:each) do
    assign(:check_list_items, [
      stub_model(CheckListItem,
        :check_list_id => 1,
        :check_id => 2,
        :position => 3
      ),
      stub_model(CheckListItem,
        :check_list_id => 1,
        :check_id => 2,
        :position => 3
      )
    ])
  end

  it "renders a list of check_list_items" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
