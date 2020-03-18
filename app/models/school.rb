class School < ApplicationRecord
  validates :name, :email, presence: true
end
