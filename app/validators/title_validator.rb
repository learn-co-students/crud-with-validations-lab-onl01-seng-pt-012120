class TitleValidator < ActiveModel::Validator

    def validate(record)
        @song = Song.find_by(title: record.title)
        if @song && @song.artist_name == record.artist_name && @song.release_year == record.release_year
            record.errors[:release_year] << "That artist has already released that song in that year"
        end
    end

end