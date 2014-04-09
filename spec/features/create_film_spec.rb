require 'spec_helper'

feature "Films" do

  scenario "viewing a list of films" do
    film = FactoryGirl.create(:film)

    visit '/films'
    page.should have_content film.title

  end

  
end