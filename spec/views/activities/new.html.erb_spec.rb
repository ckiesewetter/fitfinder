require 'rails_helper'

RSpec.describe "activities/new", type: :view do
  before(:each) do
    assign(:activity, Activity.new(
      :name => "MyString",
      :user_id => 1,
      :website => "MyString",
      :description => "MyText",
      :location => nil,
      :schedule => "MyText"
    ))
  end

  it "renders new activity form" do
    render

    assert_select "form[action=?][method=?]", activities_path, "post" do

      assert_select "input#activity_name[name=?]", "activity[name]"

      assert_select "input#activity_user_id[name=?]", "activity[user_id]"

      assert_select "input#activity_website[name=?]", "activity[website]"

      assert_select "textarea#activity_description[name=?]", "activity[description]"

      assert_select "input#activity_location_id[name=?]", "activity[location_id]"

      assert_select "textarea#activity_schedule[name=?]", "activity[schedule]"
    end
  end
end
