require 'rails_helper'

feature "Schools", type: :feature do
  scenario 'Show title page Index School' do
    visit('/schools')
    expect(page).to have_content('Schools')
  end
end
