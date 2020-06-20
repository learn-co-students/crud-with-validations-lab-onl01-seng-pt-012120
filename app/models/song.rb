class Song < ApplicationRecord
  validates :title,
  presence: true,
  uniqueness: {scope: :release_year, message: "Title cannot be repeated within the year."}

  validates :released,
  inclusion: {in: [true, false]}

  validates :release_year,
  numericality: {only_integer: true, less_than_or_equal_to: Time.now.year},
  presence: true,
  if: :released

  validates :artist_name,
              presence: true
end
