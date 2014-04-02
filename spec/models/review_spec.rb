require 'spec_helper'

describe Review do

  describe "validations" do
    it "validates presence of a film title" do
      subject.should have(1).error_on(:film_title)
    end

    it "validates presence of a director" do
      subject.should have(1).error_on(:director)
    end

    it "validates presence of a studio" do
      subject.should have(1).error_on(:studio)
    end

    it "validates presence of a review" do
      subject.should have(1).error_on(:review)
    end


    it "only allows a rating up to 10 star" do
      subject.number_of_stars = 11
      subject.should have(1).error_on(:number_of_stars)
    end

    it "validates presence of a review author" do
      subject.should have(1).error_on(:review_author)
    end
  end

end