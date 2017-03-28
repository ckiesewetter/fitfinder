require 'rails_helper'

RSpec.feature "LandingPageTaglines", type: :feature do
  context 'Going to landing page' do
    Steps 'Being welcomed' do
      Given 'I am on the landing page' do
        visit '/'
      end
      Then 'I can see a welcome message' do
        expect(page).to have_content("Welcome to FitFinder!")
      end
      And 'I can see a tagline and description' do
        expect(page).to have_content("A Fitness Group Connector")
        expect(page).to have_content("What is FitFinder?")
        expect(page).to have_content("FitFinder connects like-minded fitness enthusiasts by giving people the ability to create a fitness group or join an existing fitness group.")
      end
    end
  end
end
