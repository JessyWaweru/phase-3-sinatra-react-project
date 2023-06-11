class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :content
      t.string :username
      t.references :movie, foreign_key:true
    end
  end
end
