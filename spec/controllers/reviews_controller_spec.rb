require 'spec_helper'

describe ReviewsController do 

  it "has a new action" do
    get :new
    response.should be_ok
  end

  it "has a show action" do
    @review = Review.create
    get :show, id: @review.id
    response.should be_ok
  end

  describe "POST #create" do
    it "saves a record" do
      expect {
        post :create, review: {film_title: "Brave", studio: "Pixar", director: "Disney", review: "Mixed feelings", number_of_stars: "6", review_author: "Barry Norman"}
      }.to change{ Review.count }.from(0).to(1)

    end
  end

  it "has an index action" do
    get :index
    response.should be_ok
  end

end