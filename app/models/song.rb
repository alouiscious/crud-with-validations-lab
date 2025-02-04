class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: { 
    scope: [:release_year, :artist_name], message: 'song title permitted once per artist per year' 
  }
  
  validates :released, inclusion: { in: [true, false] }
  validates :artist_name, presence: true

  with_options if: :released? do |release|
    release.validates :release_year, presence: true
    # release.validates :release_year, uniqueness: true
    release.validates :release_year, numericality: {
      less_than_or_equal_to: Date.today.year
    }
  end

  def released?
    released
  end
end
