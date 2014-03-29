require 'spec_helper'

describe "roadblock_checks/new" do
  before(:each) do
    assign(:roadblock_check, stub_model(RoadblockCheck,
      :check_id => 1,
      :roadblock_id => 1,
      :solved_it => false
    ).as_new_record)
  end

  it "renders new roadblock_check form" do
    render

    assert_select "form[action=?][method=?]", roadblock_checks_path, "post" do
      assert_select "input#roadblock_check_check_id[name=?]", "roadblock_check[check_id]"
      assert_select "input#roadblock_check_roadblock_id[name=?]", "roadblock_check[roadblock_id]"
      assert_select "input#roadblock_check_solved_it[name=?]", "roadblock_check[solved_it]"
    end
  end
end
