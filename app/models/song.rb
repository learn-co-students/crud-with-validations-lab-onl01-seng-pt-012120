class Song < ApplicationRecord
    validates :title, presence: true
    validates :artist_name, presence: true
    validates :release_year, presence: true, 
        if: :released?
    validate :date_not_possible  
    validates :title, uniqueness: { scope: :release_year} 

    def date_not_possible
        if release_year.present? && release_year > Date.today.year
            errors.add(:release_year, "release date can't be in the future")
        end
    end
    
end


