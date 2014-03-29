require 'spec_helper'

describe "checks/new" do
  before(:each) do
    assign(:check, stub_model(Check,
      :description => "MyString",
      :input_label => "MyString",
      :input_example => "MyText"
    ).as_new_record)
  end

  it "renders new check form" do
    render

    assert_select "form[action=?][method=?]", checks_path, "post" do
      assert_select "input#check_description[name=?]", "check[description]"
      assert_select "input#check_input_label[name=?]", "check[input_label]"
      assert_select "textarea#check_input_example[name=?]", "check[input_example]"
    end
  end
end
