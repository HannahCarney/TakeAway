

class Order
  
 $dishes = {"Soup" => 4.5, "Rice" => 2, "Pizza" => 8, "Curry" => 8, "Salad" => 5, "Chicken" => 4, "Beef" => 6}
 @@quantity = 0
  
  def delivery_time
      puts "Thank you for ordering! Your Food will be delivered before #{Time.new.hour + 1 > 12 ? (Time.new.hour + 1) - 12 : Time.new.hour + 1}:#{Time.new.min < 10 ? (sprintf '%02d', Time.new.min).to_i : Time.new.min} #{Time.new.hour > 12 ? 'PM' : 'AM'} (GMT)."
  end

  def ordered
    @items ||= [] 
   end

  def item_count
    @items.count
  end

  def add_item(items)
    ordered << items
  end

  def error
    puts "There is something wrong with your order"
  end

  def quantity(items)
    if $dishes.keys.include?(items)
      @@quantity += 1
      
    end
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
        order.add_item(items)

        items = gets.chomp.capitalize
      else 
        puts "Sorry! Not a correct item from the menu. Enter one, or enter 'Finished' if you are done"
        items = gets.chomp.capitalize
      end
    end until items.capitalize == "Finished"
     puts "#{order.delivery_time}You have ordered #{order.item_count} items:"  
      order.ordered.each {|item| puts "#{item} "}
    

