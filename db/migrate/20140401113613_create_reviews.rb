class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |table|
      table.string :film_title
      table.string :studio
      table.string :director
      table.text :review
      table.integer :number_of_stars
      table.string :review_author

      table.timestamps
      
    end
  end
end
