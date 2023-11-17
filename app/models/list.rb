class List < ApplicationRecord
  has_many :bookmarks
  has_many :movies, through: :bookmarks
  validates :name, presence: true
  has_one :image
end
