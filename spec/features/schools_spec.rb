require 'rails_helper'

feature "Schools", type: :feature do
  scenario 'Show title page Index School' do
    visit(schools_path)
    expect(page).to have_content('Schools')
  end

  scenario 'School verify link Register new School' do
    visit(schools_path)
    expect(find('ul li')).to have_link('Create new School')
  end

  scenario 'School verify form Register new School' do
    visit(schools_path)
    click_on('Create new School')
    expect(page).to have_content('Create new School')
  end

  scenario 'School register new valid School' do
    visit(new_school_path)
    school_name = Faker::Name.name

    fill_in('school_name', with: school_name)
    fill_in('school_email', with: Faker::Internet.email)
    fill_in('school_website', with: Faker::Internet.domain_name)
    fill_in('school_phone', with: Faker::PhoneNumber.phone_number)
    attach_file('school_logo', "#{Rails.root}/spec/fixtures/thumb.png")
    choose(option: ['Y', 'N'].sample)
    click_on('Save')

    expect(page).to have_content('School registered successufull!')
    expect(School.last.name).to eq(school_name)
  end
end
