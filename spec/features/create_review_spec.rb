require 'spec_helper'

feature "film review" do

  scenario "creating a new film review" do
    film = FactoryGirl.create(:film)
    visit '/reviews/new'
    select film.title, from: 'review_film_id'
    fill_in 'review_review', :with => 'mixed feelings'
    choose "review_number_of_stars_6"
    fill_in 'review_review_author', :with => 'Barry Norman'
    click_button "create"

    visit '/reviews'

    page.should have_content "Lives of Others"
    # When I go to the new review page
    # and I fill out the form corectly
    # and I go to the recent reviews page
    # then I should see my reviews

  end

end