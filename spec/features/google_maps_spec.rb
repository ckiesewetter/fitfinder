require 'rails_helper'

RSpec.feature "GoogleMaps", type: :feature do
  context 'Going to landing page' do
    Steps 'Being welcomed' do
      Given 'I am on the landing page' do
        visit '/'
      end
      Then 'I can see a map of my current location with a marker' do
        expect(page).to have_content("Map")
      end
    end
  end
end
