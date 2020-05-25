class TitleValidator < ActiveModel::Validator

  def validate(record)
    if (@song = Song.find_by(title: record.title)) &&
      (@song.artist_name == record.artist_name) &&
      (@song.release_year == record.release_year)
      record.errors[:title] << "Artists cannot release the same soong twice in one year"
    end
  end

end
