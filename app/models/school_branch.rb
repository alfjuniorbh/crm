class SchoolBranch < ApplicationRecord
  validates :name, :email, :school, presence: true
  has_one_attached :logo
  belongs_to :school

  def full_description
    "#{self.name} - #{self.phone} - #{self.email}"
  end
end
