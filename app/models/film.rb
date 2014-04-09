class Film < ActiveRecord::Base
  has_many :reviews

  validates :title, presence: true 
  validates :director, presence: true
  validates :studio, presence: true
end