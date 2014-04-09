require 'spec_helper'

describe ReviewsController do 

  it "has a new action" do
    get :new
    response.should be_ok
  end

  it "has a show action" do
    @review = FactoryGirl.create(:review)
    get :show, id: @review.id
    response.should be_ok
  end

  describe "POST #create" do
    describe "with valid params" do
      it "saves a record" do
        expect {
          post :create, review: {film_id: "Brave", studio: "Pixar", director: "Disney", review: "Mixed feelings", number_of_stars: "6", review_author: "Barry Norman"}
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