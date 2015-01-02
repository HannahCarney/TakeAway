require 'takeaway'

describe Order do

order = Order.new

it "should be able to add orders" do
  expect(order.item_count).to eq(0)
  expect(order.add_item("Chicken",1)).to eq([1])
  expect(order.item_count).to eq(1)
  expect(order.ordered).to eq(["Chicken"])
end


it "should be able to add the quantity of orders" do
  order.add_item("Soup",7)
  expect(order.quantity[1]).to eq(7)
end

it "should be able to calculate cost of each items*quantity" do
   expect(order.cost("Beef", 5)).to eq(30)
   expect(order.cost("Soup", 4)).to eq(16)
end

end
