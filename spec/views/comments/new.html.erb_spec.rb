require 'spec_helper'

describe "comments/new" do
  before(:each) do
    assign(:comment, stub_model(Comment,
      :user_id => 1,
      :roadblock_id => 1,
      :contents => "MyText"
    ).as_new_record)
  end

  it "renders new comment form" do
    render

    assert_select "form[action=?][method=?]", comments_path, "post" do
      assert_select "input#comment_user_id[name=?]", "comment[user_id]"
      assert_select "input#comment_roadblock_id[name=?]", "comment[roadblock_id]"
      assert_select "textarea#comment_contents[name=?]", "comment[contents]"
    end
  end
end
