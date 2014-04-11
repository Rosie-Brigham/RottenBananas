class Film < ActiveRecord::Base
  has_many :reviews
  belongs_to :user

  validates :title, presence: true 
  validates :director, presence: true
  validates :studio, presence: true

  def self.search(search)
    if search
      find(:all, :conditions =>['title LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end
end