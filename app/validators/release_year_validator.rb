class ReleaseYearValidator < ActiveModel::Validator

    def validate(record)
        if record.released
            current_date = Time.new
            unless record.release_year && record.release_year <= current_date.year
                record.errors[:release_year] << "Missing release year and release year cannot be in the future"
            end
        end
    end

end
