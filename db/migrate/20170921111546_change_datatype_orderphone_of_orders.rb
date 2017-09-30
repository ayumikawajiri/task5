class ChangeDatatypeOrderphoneOfOrders < ActiveRecord::Migration[5.1]
  def change
  	change_column :orders, :orderphone, :string
  end
end
