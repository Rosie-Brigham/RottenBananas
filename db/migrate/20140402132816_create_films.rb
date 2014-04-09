class CreateFilms < ActiveRecord::Migration
  def change
    create_table :films do |table|
      table.string :title
      table.string :studio
      table.string :director

    end
  end
end
