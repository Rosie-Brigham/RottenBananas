class RenameReviewColumns < ActiveRecord::Migration
  def change 
    rename_column :reviews, :review, :comment
    rename_column :reviews, :review_author, :author
    remove_column :reviews, :studio
    remove_column :reviews, :director
    remove_column :reviews, :film_title
  end
end
