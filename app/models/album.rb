class Album < ActiveRecord::Base
  has_many :songs
  has_many :comments

  def self.by_rating
    self.all.order(rating: :desc)
  end

end
