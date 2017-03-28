require 'rails_helper'

RSpec.describe "locations/index", type: :view do
  before(:each) do
    assign(:locations, [
      Location.create!(
        :name => "Name",
        :adderss => "Adderss",
        :city => "City",
        :state => "State",
        :zip => "Zip",
        :latitude => 2.5,
        :longitude => 3.5
      ),
      Location.create!(
        :name => "Name",
        :adderss => "Adderss",
        :city => "City",
        :state => "State",
        :zip => "Zip",
        :latitude => 2.5,
        :longitude => 3.5
      )
    ])
  end

  it "renders a list of locations" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Adderss".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Zip".to_s, :count => 2
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => 3.5.to_s, :count => 2
  end
end
