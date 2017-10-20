100.times do |i|
  Order.seed(:id,
    {
      id: i + 1,
      post_id: rand(1..100),
      user_id: rand(1..10),
      ordername: "注文者#{rand(1..10)}",
      orderphone: "090#{rand(1..9)}2345678",
      orderemail: "user#{rand(1..10)}@user.com",
      orderaddress: "user#{rand(1..10)}-#{rand(1..10)}-#{rand(1..10)}"
    }
  )
end
