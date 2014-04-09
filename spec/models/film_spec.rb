require 'spec_helper'

  describe Film do

    describe "validations" do
    it "validates presence of a film title" do
      subject.should have(1).error_on(:title)
    end

    it "validates presence of a director" do
      subject.should have(1).error_on(:director)
    end

    it "validates presence of a studio" do
      subject.should have(1).error_on(:studio)
    end

  end

end