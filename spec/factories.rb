# going to tell factory girl how to build the things we want to test
# it must be valid!!!

FactoryGirl.define do

  factory :review do
    film_title "Brave"
    studio "Pixar"
    director "Disney"
    number_of_stars "6"
    review "Mixed feelings"
    review_author "Barry Norman"
  end

end
