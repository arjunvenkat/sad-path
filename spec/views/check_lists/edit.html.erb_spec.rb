require 'spec_helper'

describe "check_lists/edit" do
  before(:each) do
    @check_list = assign(:check_list, stub_model(CheckList,
      :name => "MyString"
    ))
  end

  it "renders the edit check_list form" do
    render

    assert_select "form[action=?][method=?]", check_list_path(@check_list), "post" do
      assert_select "input#check_list_name[name=?]", "check_list[name]"
    end
  end
end
