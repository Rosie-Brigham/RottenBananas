require 'spec_helper'

describe FilmsController do

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



  it "has an index action" do
    get :index
    response.should be_ok
  end


end