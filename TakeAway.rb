$dishes = {"Soup" => 4.5, "Rice" => 2, "Pizza" => 8, "Curry" => 8, "Salad" => 5, "Chicken" => 4, "Beef" => 6}

  puts "Hello, and welcome to TakeAway! Here is the menu:"
  $dishes.each {|key, value| puts "#{key}: $#{value}"}
    puts "Please pick an item or items from the menu by typing the menu item"
    items = gets.chomp
    begin
    puts "If you are finished ordering then type 'Finished' otherwise type in another item"
    items = gets.chomp
  end until items.capitalize == "Finished"

class Order


  def initialize(order, quantities, number)
    @order = order
    @quantities = quantities
    @number = number
  end
  
  
  def order_now
    puts "Please pick an item or items from the menu by typing the menu item"
    items = gets.chomp
    puts "If you are finished ordering then type 'Finished' otherwise type in another item"
    quit = gets.chomp
  end

  def error
    puts "There is something wrong with your order"
  end

  def order_placed
    puts "Thank you! Your order was placed and will be delivered before 18:52."
  end

end

order1 = Order.new($dishes["Soup"], 4, 4)

