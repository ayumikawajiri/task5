json.extract! order, :id, :post_id, :user_id, :ordername, :orderphone, :orderemail, :orderaddress, :created_at, :updated_at
json.url order_url(order, format: :json)
