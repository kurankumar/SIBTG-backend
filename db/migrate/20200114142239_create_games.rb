class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :name
      t.text :description
      t.integer :score
      t.string :image

      t.integer :genre_id

      t.timestamps
    end
  end
end
