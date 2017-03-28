require 'rails_helper'

RSpec.describe "activities/index", type: :view do
  before(:each) do
    assign(:activities, [
      Activity.create!(
        :name => "Name",
        :user_id => 2,
        :website => "Website",
        :description => "MyText",
        :location => nil,
        :schedule => "MyText"
      ),
      Activity.create!(
        :name => "Name",
        :user_id => 2,
        :website => "Website",
        :description => "MyText",
        :location => nil,
        :schedule => "MyText"
      )
    ])
  end

  it "renders a list of activities" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Website".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
