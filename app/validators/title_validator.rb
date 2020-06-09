class TitleValidator < ActiveModel::Validator 
    def validate(record)
        if record.title != nil
            if Song.find_by(title: record.title)
                song = Song.find_by(title: record.title)
                if song.artist_name == record.artist_name && song.release_year == record.release_year
                    record.errors[:title] << "Title can't be repeated by the same artist in the same year!"
                end
            end
        end
    end

end
