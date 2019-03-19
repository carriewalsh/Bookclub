class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string :username
      t.string :title
      t.integer :rating
      t.text :review_text
      t.references :books, foreign_key: true

      t.timestamps
    end
  end
end
