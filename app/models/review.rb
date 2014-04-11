# class ReviewAuthor < ActiveRecord::Base
#   has_many :films
#   has_many :reviews, through: :films
# end



class Review < ActiveRecord::Base
  belongs_to :film
  belongs_to :user

  validates :film_id, presence: true 
  validates :comment, presence: true
  validates :author, presence: true
  validates :number_of_stars, inclusion: { in: 1..10 }

  
end