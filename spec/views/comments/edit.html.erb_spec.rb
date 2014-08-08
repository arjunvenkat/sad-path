require 'spec_helper'

describe "comments/edit" do
  before(:each) do
    @comment = assign(:comment, stub_model(Comment,
      :user_id => 1,
      :roadblock_id => 1,
      :contents => "MyText"
    ))
  end

  it "renders the edit comment form" do
    render

    assert_select "form[action=?][method=?]", comment_path(@comment), "post" do
      assert_select "input#comment_user_id[name=?]", "comment[user_id]"
      assert_select "input#comment_roadblock_id[name=?]", "comment[roadblock_id]"
      assert_select "textarea#comment_contents[name=?]", "comment[contents]"
    end
  end
end
