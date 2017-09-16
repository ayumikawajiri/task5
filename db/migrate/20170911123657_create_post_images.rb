class CreatePostImages < ActiveRecord::Migration[5.1]
  def change
    create_table :post_images do |t|
      t.integer :post_id
      t.string :image_id
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
