class Song < ApplicationRecord
    include ActiveModel::Validations

    validates :title, presence: true
    validates_with TitleValidator
    validates :released, inclusion: { in: [true, false]}
    validates :artist_name, presence: true

    validates_with ReleaseYearValidator
    
end
