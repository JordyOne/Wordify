require 'rails_helper'
require 'capybara/rails'

feature 'welcome input' do
  scenario 'user can visit welcome page' do
    visit root_path

    expect(page).to have_content("What number would you like converted?")
  end

  scenario 'user can submit information' do
    visit root_path

    fill_in :number, with: '33'
    click_on 'Submit'

    expect(page).to have_content("Your Number Translates To:")
  end

end