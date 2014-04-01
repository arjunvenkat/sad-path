require 'spec_helper'

describe "check_lists/show" do
  before(:each) do
    @check_list = assign(:check_list, stub_model(CheckList,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
