require 'spec_helper'

describe FilmsController do

  let(:film) { FactoryGirl.create(:film) }
  let(:review) {FactoryGirl.create(:review)}

  it "should create a new film" do
    get :new
    response.should be_ok
  end

  it "has a show action, to show the new film" do
    @film = FactoryGirl.create(:film)
    get :show, id: @film.id
    response.should be_ok
  end

  describe "POST #create" do
    describe "with valid params" do
      it "saves a record" do
        expect {
          post :create, film: {title: "Lives of Others", studio: "somewhere German", director: "can't remember"}}.to change{ Film.count }.from(0).to(1)
      end
    end

  
    describe 'with invalid params' do
      let(:invalid_params) do
        { film: {title: "", studio: "", director: ""} }
      end
      

      it "it does not save a new film record" do
        expect {
            post :create, invalid_params
          }.to_not change { Film.count }
      end
      
      it "renders a new form for film" do
        post :create, invalid_params
        response.should render_template(:new)
      end
    end
  end


  describe "PUT #update" do
    describe "with valid params" do
      it "edits a record" do

          put :update, id: film.id, film: {title: "Lives of Others", studio: "Spamalot", director: "can't remember"}
          film.reload
          film.studio.should eq "Spamalot"
        
      end

       it "updates a record" do
  #       # Make sure we've saved the film before the expect block!
        film = FactoryGirl.create(:film) 
        expect {
         put :update, id: film.id, film: {title: "Lives of Others", studio: "Spamalot", director: "can't remember"}
        }.to_not change{ Film.count }
      end

    end
  end

  describe "DELETE #destroy" do
    it "deletes a film" do
      #  # Make sure we've saved the review before the then delete it!
       @film = FactoryGirl.create(:film)
       expect {
       delete :destroy, id: @film.id 
       }.to change{ Film.count }.from(1).to(0)       
      
    end 
  end

  it "has an index action" do
    get :index
    response.should be_ok
  end


end