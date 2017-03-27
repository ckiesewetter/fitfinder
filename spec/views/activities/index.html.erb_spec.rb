require 'rails_helper'

RSpec.describe "activities/index", type: :view do
  before(:each) do
    assign(:activities, [
      Activity.create!(
        :title => "Title",
        :description => "MyText",
        :location_name => "Location Name",
        :address => "Address",
        :city => "City",
        :state => "State",
        :zip => 2,
        :latitude => 3.5,
        :longitude => 4.5
      ),
      Activity.create!(
        :title => "Title",
        :description => "MyText",
        :location_name => "Location Name",
        :address => "Address",
        :city => "City",
        :state => "State",
        :zip => 2,
        :latitude => 3.5,
        :longitude => 4.5
      )
    ])
  end

  it "renders a list of activities" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Location Name".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.5.to_s, :count => 2
    assert_select "tr>td", :text => 4.5.to_s, :count => 2
  end
end
