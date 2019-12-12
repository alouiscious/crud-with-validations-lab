class Song < ActiveRecord::Base
  validates :title, presence: true, 
  validates :title, uniqueness: { scope: %i[:release_year artist_name]
,  message: "Song title permitted once per artist per year" }
  
  validates :released, inclusion: {in: [true, false] }
  validates :artist_name, presence: true

  with_options if: :released? do |release|
    release.validates :release_year, numerically: { less_than_or_equal_to: Date.today.year }
    release.validates :release_year, presence: true
  end
end
