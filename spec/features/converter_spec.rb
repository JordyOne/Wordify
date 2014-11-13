require 'rails_helper'
require 'capybara/rails'

feature 'converter page' do
  scenario 'user can convert single digit numbers' do
    visit root_path

    fill_in :number, with: '3'
    click_on 'Submit'

    expect(page).to have_content('Three')
  end

  scenario 'user can convert double digit numbers' do
    visit root_path

    fill_in :number, with: '21'
    click_on 'Submit'

    expect(page).to have_content('Twenty One')
  end

  scenario 'user can convert triple digit numbers' do
    visit root_path

    fill_in :number, with: '221'
    click_on 'Submit'

    expect(page).to have_content('Two Hundred and Twenty One')
  end

  scenario 'user can convert four digit numbers' do
    visit root_path

    fill_in :number, with: '2221'
    click_on 'Submit'

    expect(page).to have_content('Two Thousand Two Hundred and Twenty One')
  end
end