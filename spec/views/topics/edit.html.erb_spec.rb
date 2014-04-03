require 'spec_helper'

describe "topics/edit" do
  before(:each) do
    @topic = assign(:topic, stub_model(Topic,
      :name => "MyString",
      :course_id => 1,
      :current => false,
      :position => 1
    ))
  end

  it "renders the edit topic form" do
    render

    assert_select "form[action=?][method=?]", topic_path(@topic), "post" do
      assert_select "input#topic_name[name=?]", "topic[name]"
      assert_select "input#topic_course_id[name=?]", "topic[course_id]"
      assert_select "input#topic_current[name=?]", "topic[current]"
      assert_select "input#topic_position[name=?]", "topic[position]"
    end
  end
end
