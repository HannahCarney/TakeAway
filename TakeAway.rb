dishes = {"Soup" => 4.5, "Rice" => 2, "Pizza" => 8, "Curry" => 8, "Salad" => 5, "Chicken" => 4, "Beef" => 6}

class Order


  def initialize(order, quantities, number)
    @order = order
    @quantities = quantities
    @number = number
  end

  def error
    puts "There is something wrong with your order"
  end

  def order_placed
    puts "Thank you! Your order was placed and will be delivered before 18:52."
  end

end

order1 = Order.new(dishes["Soup"], 4, 4)

