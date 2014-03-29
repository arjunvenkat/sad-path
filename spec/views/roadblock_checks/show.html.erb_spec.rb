require 'spec_helper'

describe "roadblock_checks/show" do
  before(:each) do
    @roadblock_check = assign(:roadblock_check, stub_model(RoadblockCheck,
      :check_id => 1,
      :roadblock_id => 2,
      :solved_it => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/false/)
  end
end
