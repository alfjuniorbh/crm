class School < ApplicationRecord
  validates :name, :email, presence: true
  has_one_attached :logo
  has_many :school_branches, dependent: :destroy
end
