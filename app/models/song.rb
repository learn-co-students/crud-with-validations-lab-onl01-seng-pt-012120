class Song < ActiveRecord::Base
    validates :title, presence: true
    validates :title, uniqueness: {scope: [:artist_name, :release_year]}
    validates :artist_name, presence: true
    validates :released, inclusion: {in: [true, false]}
    validate :release_year_validation

    def release_year_validation
        if self.released
            unless self.release_year
                errors.add(:release_year, "Must have a release year")
            else
                now = Time.new
                if self.release_year > now.year
                    errors.add(:release_year, "The release year is in the future")
                end
            end
        end
    end


end
