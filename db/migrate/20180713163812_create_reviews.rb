class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string :content
      t.integer :rating
      t.references :book, foreign_key: true
      t.references :user, foreign_key: true
    end
  end
end
