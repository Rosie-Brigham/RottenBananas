require 'spec_helper'

feature "Films" do

  scenario "viewing a list of films" do
    film = FactoryGirl.create(:film)

    visit '/films'
    page.should have_content film.title

  end

  context "when logged in" do
    before do
      user = FactoryGirl.create(:user)
      login_as(user)
    end

    scenario "when editing a film" do
      @film = FactoryGirl.create(:film)
      visit "/films/#{@film.id}"
      click_link 'Edit film'
      fill_in "Title", :with => "Labyrinth"
      click_button 'Update' 
      page.should have_content "Labyrinth"

    end

    scenario "when deleting a film"  do
      @film = FactoryGirl.create(:film)
      visit "/films/#{@film.id}"
      click_button 'Delete film'
      expect(page).to have_text("That film has been deleted")
    end
  end

  context "when not logged in" do
    scenario "asking for log in" do
      visit "/films"
      click_link 'Add a film'
      expect(page).to have_text("You need to sign in or sign up before continuing.")
    end
  end

end