class CreateMovie < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :image_url
      t.integer :star_rating
      t.text :about
    end
  end
end
