require 'spec_helper'

describe "checks/show" do
  before(:each) do
    @check = assign(:check, stub_model(Check,
      :description => "Description",
      :input_label => "Input Label",
      :input_example => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Input Label/)
    expect(rendered).to match(/MyText/)
  end
end
