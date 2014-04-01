require 'spec_helper'

feature "film review" do

  scenario "creating a new film review" do

    visit '/reviews/new'
    fill_in 'review_film_title', :with => 'Brave'
    fill_in 'review_studio', :with => 'Pixar'
    fill_in 'review_director', :with => 'Disney'
    fill_in 'review_review', :with => 'mixed feelings'
    choose "review_number_of_stars_6"
    fill_in 'review_review_author', :with => 'Barry Norman'
    click_button "create"

    visit '/reviews'

    page.should have_content "Brave"
    # When I go to the new review page
    # and I fill out the form corectly
    # and I go to the recent reviews page
    # then I should see my reviews

  end

end