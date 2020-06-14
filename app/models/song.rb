class Song < ApplicationRecord
    validates :title, presence: true, uniqueness: {scope: :year, message: "should happen once per year"}
    validates :released, inclusion:  {in: [true , false]
    validates :artist_name, presence:


    validate :release_year

    def release_year
        if self.released
            unless self.release_year
            errors.add(:release_year, " Song must have a realease year")
            else
             now = Time.new
       if now.year < self.release_year
              errors.add(:realese_year, "Release year is future")

         end
       end
     end
    end
