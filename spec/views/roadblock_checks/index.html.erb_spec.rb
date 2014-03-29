require 'spec_helper'

describe "roadblock_checks/index" do
  before(:each) do
    assign(:roadblock_checks, [
      stub_model(RoadblockCheck,
        :check_id => 1,
        :roadblock_id => 2,
        :solved_it => false
      ),
      stub_model(RoadblockCheck,
        :check_id => 1,
        :roadblock_id => 2,
        :solved_it => false
      )
    ])
  end

  it "renders a list of roadblock_checks" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
