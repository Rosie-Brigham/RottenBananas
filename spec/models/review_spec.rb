require 'spec_helper'

describe Review do

  describe "validations" do
    it "validates presence of a film title" do
      subject.should have(1).error_on(:film_id)
    end

    
    it "validates presence of a review" do
      subject.should have(1).error_on(:comment)
    end


    it "only allows a rating up to 10 star" do
      subject.number_of_stars = 11
      subject.should have(1).error_on(:number_of_stars)
    end

    it "validates presence of a review author" do
      subject.should have(1).error_on(:author)
    end
  end

end