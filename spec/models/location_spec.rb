require 'rails_helper'

RSpec.describe Location, type: :model do
  it "should have a full address method" do
    location = Location.new(address: '2804 Lincoln Ave',
                            city: 'San Diego',
                            state: "CA",
                            zip: '92104'
                            )
    expect(location.full_address).to eq("2804 Lincoln Ave, San Diego, CA, 92104")
  end

  it "should geocode the address correctly on save" do
    location = Location.new(address: '2804 Lincoln Ave',
                            city: 'San Diego',
                            state: "CA",
                            zip: '92104'
                            )
    expect(location.latitude).to be_blank
    expect(location.longitude).to be_blank
    location.save
    location.reload
    expect(location.latitude).to eq(32.7504799)
    expect(location.longitude).to eq(-117.1336303)
  end
end
