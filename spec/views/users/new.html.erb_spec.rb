require 'spec_helper'

describe "users/new" do
  before(:each) do
    assign(:user, stub_model(User,
      :userID => "MyString",
      :userName => "MyString",
      :emailID => "MyString",
      :firstName => "MyString",
      :lastName => "MyString",
      :roles => "MyString"
    ).as_new_record)
  end

  it "renders new user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", users_path, "post" do
      assert_select "input#user_userID[name=?]", "user[userID]"
      assert_select "input#user_userName[name=?]", "user[userName]"
      assert_select "input#user_emailID[name=?]", "user[emailID]"
      assert_select "input#user_firstName[name=?]", "user[firstName]"
      assert_select "input#user_lastName[name=?]", "user[lastName]"
      assert_select "input#user_roles[name=?]", "user[roles]"
    end
  end
end
