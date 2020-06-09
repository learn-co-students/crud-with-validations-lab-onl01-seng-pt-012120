class ReleaseYearValidator < ActiveModel::Validator
    def validate(record)
        if record.released == true
            if record.release_year == nil || record.release_year == ""
                record.errors[:release_year] << "Release year cannot be blank if released is true"
            elsif record.release_year > Date.today.year
                record.errors[:release_year] << "Cannot be a future date"
            end
        end
    end
end

