class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :publication_year
      t.integer :pages
      t.text :cover_image

      t.timestamps
    end
  end
end
