require 'spec_helper'

describe "check_list_items/new" do
  before(:each) do
    assign(:check_list_item, stub_model(CheckListItem,
      :check_list_id => 1,
      :check_id => 1,
      :position => 1
    ).as_new_record)
  end

  it "renders new check_list_item form" do
    render

    assert_select "form[action=?][method=?]", check_list_items_path, "post" do
      assert_select "input#check_list_item_check_list_id[name=?]", "check_list_item[check_list_id]"
      assert_select "input#check_list_item_check_id[name=?]", "check_list_item[check_id]"
      assert_select "input#check_list_item_position[name=?]", "check_list_item[position]"
    end
  end
end
