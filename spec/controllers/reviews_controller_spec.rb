require 'spec_helper'

describe ReviewsController do 

  let(:film) { FactoryGirl.create(:film) }
  let(:review) {FactoryGirl.create(:review)}

  it "has a new action" do
    get :new
    response.should be_ok
  end

  it "has a show action" do
    @review = FactoryGirl.create(:review)
    get :show, id: @review.id
    response.should be_ok
  end

  describe "PUT #update" do
    describe "with valid params" do
      it "edits a record" do

          put :update, id: review.id, review: {film_id: film.id, review: "well good", number_of_stars: "6", review_author: "Barry Norman"}
          review.reload
          review.review.should eq "well good"
        
      end

       it "updates a record" do
        # Make sure we've saved the review before the expect block!
        review = FactoryGirl.create(:review) 
        expect {
         put :update, id: review.id, review: {film_id: film.id, review: "Mixed feelings", number_of_stars: "6", review_author: "Barry Norman"}
        }.to_not change{ Review.count }
      end
    end

    
  end

  describe "POST #create" do
    describe "with valid params" do
      it "saves a record" do
        expect {
          post :create, review: {film_id: film.id, review: "Mixed feelings", number_of_stars: "6", review_author: "Barry Norman"}
        }.to change{ Review.count }.from(0).to(1)
      end
    end
  

    describe 'with invalid params' do
      let(:invalid_params) do
        { review: {film_title: "", studio: "", director: "", review: "", number_of_stars: "", review_author: ""} }
      end
      it "it does not save a record" do
        expect {
            post :create, invalid_params
          }.to_not change{ Review.count }
      end
      it "renders a new form" do
        post :create, invalid_params
        response.should render_template(:new)
      end
    end
  end



  it "has an index action" do
    get :index
    response.should be_ok
  end

end