class Song < ApplicationRecord
  validates :title, presence: true
  validates_with TitleValidator
  validates :released, inclusion: {in: [true , false]}
  validates_with ReleaseYearValidator
  validates :artist_name, presence: true
end
