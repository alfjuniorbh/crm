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

  scenario 'School register new invalid School' do
    visit(new_school_path)
    click_on('Save')
    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Email can't be blank")
  end

  scenario 'Show School by id' do
    school = create(:school)

    visit(school_path(school.id))
    expect(page).to have_content(school.name)
    expect(page).to have_content(school.email)
    expect(page).to have_content(school.website)
    expect(page).to have_content(school.phone)
  end

  scenario 'List all School' do
    school_1 = create(:school)

    school_2 = create(:school)

    visit(schools_path)
    expect(page).to have_content(school_1.name).and have_content(school_2.name)
    expect(page).to have_content(school_1.email).and have_content(school_2.email)
    expect(page).to have_content(school_1.website).and have_content(school_2.website)
    expect(page).to have_content(school_1.phone).and have_content(school_2.phone)

  end

  scenario 'Update School by id' do
    school = create(:school)

    new_name = Faker::Name.name
    visit(edit_school_path(school.id))
    fill_in('school_name', with: new_name)

    click_on('Save')

    expect(page).to have_content('School updated successufull!')
    expect(page).to have_content(new_name)
  end

  scenario 'Click show School' do
    school = create(:school)
    visit(schools_path)
    find(:xpath, '/html/body/table/tbody/tr[1]/td[8]/a[1]').click
    expect(page).to have_content('Show School')
  end

  scenario 'Click edit School' do
    school = create(:school)
    visit(schools_path)
    find(:xpath, '/html/body/table/tbody/tr[1]/td[8]/a[2]').click
    expect(page).to have_content('Edit School')
  end

  #scenario 'Click destroy School', js: true do
  scenario 'Click destroy School' do
    school = create(:school)
    visit(schools_path)
    
    #find(:xpath, '/html/body/table/tbody/tr[1]/td[8]/a[3]').click
    #1.second
    #page.driver.browser.window_handles.last
    #expect(page).to have_content('School deleted successful!')
  end

end
