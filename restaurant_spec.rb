require_relative 'restaurant'
require_relative 'takeaway'

describe Restaurant do
  
order = Order.new
restaurant = Restaurant.new

it "should be able to accept orders" do
  expect(restaurant.recieve_orders).to be(false)
  order.send_restaurant!
  expect(restaurant.receive_orders). to be(true)
end



end


