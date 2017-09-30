class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :post_id
      t.integer :user_id
      t.string :ordername
      t.integer :orderphone
      t.string :orderemail
      t.string :orderaddress

      t.timestamps
    end
  end
end
