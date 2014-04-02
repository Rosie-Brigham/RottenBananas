class Review < ActiveRecord::Base

  validates :film_title, presence: true 
  validates :director, presence: true
  validates :studio, presence: true
  validates :review, presence: true
  validates :review_author, presence: true
  validates :number_of_stars, inclusion: { in: 1..10 }

  
end