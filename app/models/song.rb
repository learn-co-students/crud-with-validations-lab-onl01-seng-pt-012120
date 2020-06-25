class Song < ApplicationRecord
  validates :title, presence: true
  validates :artist_name, presence: true
  validates :title, uniqueness: { scope: [:artist_name, :release_year] }
  validates :released, inclusion: { in: [true, false] }
  validate :release_year_exist
  validate :release_year_date

  def release_year_exist
    if released && release_year == nil
      errors.add(:release_year, "release year must be filled out.")
    end
  end
  
  def release_year_date
    if release_year != nil
      if release_year > Date.today.year
        errors.add(:release_year, "must be this year or earlier")
      end
    end
  end
end
