class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :user
      t.integer :stars
      t.text :message
      t.integer :product_id

      t.timestamps
    end
  end
end
