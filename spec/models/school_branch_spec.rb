require 'rails_helper'

RSpec.describe SchoolBranch, type: :model do
  it 'is valid with name, email, website, phone, logo, is_active and School Group' do
    school_branch = create(:school_branch)
    expect(school_branch).to be_valid
  end

  context 'Validates' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
  end

  context 'Associations' do
    it { should belong_to(:school) }
  end

  context 'Intance Methods' do
    it 'return full School description' do
      school_branch = create(:school_branch)
      expect(school_branch.full_description).to eq("#{school_branch.name} - #{school_branch.phone} - #{school_branch.email}")
    end
  end
end
