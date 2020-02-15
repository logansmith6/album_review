class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :album_name
      t.string :content
      t.string :genre
      t.integer :rating
      t.integer :user_id
    end
  end
end
