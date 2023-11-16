class Bookmark < ApplicationRecord
  belongs_to :movie, dependent: :destroy
  belongs_to :list, dependent: :destroy
  validates :comment, length: { minimum: 6 }
  validates_associated :movie, :list, uniqueness: true
end
