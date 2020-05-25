class ReleaseYearValidator < ActiveModel::Validator

  def validate(record)
    if (record.released == true) && (record.release_year == nil)
      record.errors[:release_year] << "released records must have a release year"
    elsif record.release_year && (record.release_year > 2020)
      record.errors[:release_year] << "too futuristic, man"
    end
  end

end
