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

    expect(page).to have_content('Two Hundred Twenty One')
  end

  scenario 'user can convert four digit numbers' do
    visit root_path

    fill_in :number, with: '542221'
    click_on 'Submit'

    expect(page).to have_content('Five Hundred Forty Two Thousand Two Hundred Twenty One')
  end

  scenario 'class can correctly format number' do
    visit root_path

    fill_in :number, with: '222,221'
    click_on 'Submit'

    expect(page).to have_content('Two Hundred Twenty Two Thousand Two Hundred Twenty One')
  end

  scenario 'class can handle decimal numbers' do
    visit root_path

    fill_in :number, with: '222,221.50'
    click_on 'Submit'

    expect(page).to have_content('Two Hundred Twenty Two Thousand Two Hundred Twenty One and 50/100')
  end

  scenario 'class can round decimal numbers' do
    visit root_path

    fill_in :number, with: '222,221.501'
    click_on 'Submit'

    expect(page).to have_content('Two Hundred Twenty Two Thousand Two Hundred Twenty One and 50/100')
  end

  scenario 'can convert numbers not modulo 3' do
    visit root_path

    fill_in :number, with: '2,222,221'
    click_on 'Submit'

    expect(page).to have_content('Two Million Two Hundred Twenty Two Thousand Two Hundred Twenty One ')
  end
end