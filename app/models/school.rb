class School < ApplicationRecord
  validates :name, :email, presence: true
  has_one_attached :logo
  
end
