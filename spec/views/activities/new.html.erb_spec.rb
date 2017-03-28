require 'rails_helper'

RSpec.describe "activities/new", type: :view do
  before(:each) do
    assign(:activity, Activity.new(
      :title => "MyString",
      :description => "MyText",
      :location_name => "MyString",
      :address => "MyString",
      :city => "MyString",
      :state => "MyString",
      :zip => 1,
      :latitude => 1.5,
      :longitude => 1.5
    ))
  end

  it "renders new activity form" do
    render

    assert_select "form[action=?][method=?]", activities_path, "post" do

      assert_select "input#activity_title[name=?]", "activity[title]"

      assert_select "textarea#activity_description[name=?]", "activity[description]"

      assert_select "input#activity_location_name[name=?]", "activity[location_name]"

      assert_select "input#activity_address[name=?]", "activity[address]"

      assert_select "input#activity_city[name=?]", "activity[city]"

      assert_select "input#activity_state[name=?]", "activity[state]"

      assert_select "input#activity_zip[name=?]", "activity[zip]"

      assert_select "input#activity_latitude[name=?]", "activity[latitude]"

      assert_select "input#activity_longitude[name=?]", "activity[longitude]"
    end
  end
end
