require 'spec_helper'

describe "check_list_items/show" do
  before(:each) do
    @check_list_item = assign(:check_list_item, stub_model(CheckListItem,
      :check_list_id => 1,
      :check_id => 2,
      :position => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
