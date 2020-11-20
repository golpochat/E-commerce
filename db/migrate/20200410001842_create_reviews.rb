class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.string :author_name
      t.text :body
      t.integer :rating, default: 0
      t.references :item, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
