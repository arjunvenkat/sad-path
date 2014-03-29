require 'spec_helper'

describe "roadblock_checks/edit" do
  before(:each) do
    @roadblock_check = assign(:roadblock_check, stub_model(RoadblockCheck,
      :check_id => 1,
      :roadblock_id => 1,
      :solved_it => false
    ))
  end

  it "renders the edit roadblock_check form" do
    render

    assert_select "form[action=?][method=?]", roadblock_check_path(@roadblock_check), "post" do
      assert_select "input#roadblock_check_check_id[name=?]", "roadblock_check[check_id]"
      assert_select "input#roadblock_check_roadblock_id[name=?]", "roadblock_check[roadblock_id]"
      assert_select "input#roadblock_check_solved_it[name=?]", "roadblock_check[solved_it]"
    end
  end
end
