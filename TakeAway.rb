@items = []

class Order
  
 $dishes = {"Soup" => 4.5, "Rice" => 2, "Pizza" => 8, "Curry" => 8, "Salad" => 5, "Chicken" => 4, "Beef" => 6}
  
 
  def initialize
   
  end
  

  def ordered
    @items = []
  end

  def item_count
    @items.count
  end

  def error
    puts "There is something wrong with your order"
  end

  def order_placed
    puts "Thank you! Your order was placed and will be delivered before 18:52."
  end
end

order = Order.new
  puts "Hello, and welcome to TakeAway! Here is the menu:"
  $dishes.each {|key, value| puts "#{key}: $#{value}"}
    puts "Please pick an item from the menu by typing the menu item"
    items = gets.chomp.capitalize
    begin
      if $dishes.has_key?(items)
        puts "Order for #{items} has been placed. Would you like to order anything else?"
        @items << items
        items = gets.chomp.capitalize
      else 
        puts "Sorry! Not a correct item from the menu. Enter one, or enter 'Finished' if you are done"
        items = gets.chomp.capitalize
      end
    end until items.capitalize == "Finished"
     puts "Thank you for ordering! You now have ordered #{@items.count} items:"  
      @items.each {|item| puts "#{item} "}

