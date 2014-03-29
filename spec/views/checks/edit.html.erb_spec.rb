require 'spec_helper'

describe "checks/edit" do
  before(:each) do
    @check = assign(:check, stub_model(Check,
      :description => "MyString",
      :input_label => "MyString",
      :input_example => "MyText"
    ))
  end

  it "renders the edit check form" do
    render

    assert_select "form[action=?][method=?]", check_path(@check), "post" do
      assert_select "input#check_description[name=?]", "check[description]"
      assert_select "input#check_input_label[name=?]", "check[input_label]"
      assert_select "textarea#check_input_example[name=?]", "check[input_example]"
    end
  end
end
