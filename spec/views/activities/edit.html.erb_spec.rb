require 'rails_helper'

RSpec.describe "activities/edit", type: :view do
  before(:each) do
    @activity = assign(:activity, Activity.create!(
      :name => "MyString",
      :user_id => 1,
      :website => "MyString",
      :description => "MyText",
      :location => nil,
      :schedule => "MyText"
    ))
  end

  it "renders the edit activity form" do
    render

    assert_select "form[action=?][method=?]", activity_path(@activity), "post" do

      assert_select "input#activity_name[name=?]", "activity[name]"

      assert_select "input#activity_user_id[name=?]", "activity[user_id]"

      assert_select "input#activity_website[name=?]", "activity[website]"

      assert_select "textarea#activity_description[name=?]", "activity[description]"

      assert_select "input#activity_location_id[name=?]", "activity[location_id]"

      assert_select "textarea#activity_schedule[name=?]", "activity[schedule]"
    end
  end
end
