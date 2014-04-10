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

  end

  scenario "when editing a review" do
    @review = FactoryGirl.create(:review)
    visit "/reviews/#{@review.id}"
    click_link 'Edit'
    fill_in 'Review', :with => 'meh'
    click_button 'create'
    page.should have_content 'meh' 
  end

  scenario "when deleting a review" do
    @review = FactoryGirl.create(:review)
    visit "/reviews/#{@review.id}"
    click_button "Delete Review"
    expect(page).to have_text("That review has been deleted.")
  end


end