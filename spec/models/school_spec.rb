require 'rails_helper'

RSpec.describe School, type: :model do
  it 'is valid with name, email, website, phone, logo and is_active' do
    school = create(:school)
    expect(school).to be_valid
  end
end
