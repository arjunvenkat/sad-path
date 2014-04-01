require 'spec_helper'

describe "check_lists/new" do
  before(:each) do
    assign(:check_list, stub_model(CheckList,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new check_list form" do
    render

    assert_select "form[action=?][method=?]", check_lists_path, "post" do
      assert_select "input#check_list_name[name=?]", "check_list[name]"
    end
  end
end
