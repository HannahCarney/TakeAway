 DEFAULT_COUNT = 0

class Order
  
 $dishes = {"Soup" => 4.5, "Rice" => 2, "Pizza" => 8, "Curry" => 8, "Salad" => 5, "Chicken" => 4, "Beef" => 6}
 @@quantity = 0


  def start_statement
    puts "Hello, and welcome to TakeAway! Here is the menu:"
    $dishes.each {|key, value| puts "#{key}: $#{value}"}
    puts "Please pick an item from the menu by typing the menu item"
  end

  def ordered
    @quantity ||= []
    @items ||= []
   end

  def item_count
     @items.nil? ? 0 : @items.count
  end

  def add_item(items, amount)
    ordered << amount
    ordered << items
    
  end


  def delivery_time
      puts "Thank you for ordering! Your Food will be delivered before #{Time.new.hour + 1 > 12 ? (Time.new.hour + 1) - 12 : Time.new.hour + 1}:#{Time.new.min < 10 ? (sprintf '%02d', Time.new.min).to_i : Time.new.min} #{Time.new.hour > 12 ? 'PM' : 'AM'} (GMT)."
  end

  def end_statement
     puts "#{self.delivery_time}You have ordered #{self.item_count} categories of food:"  

     self.ordered.each {|quantity, item| puts "#{quantity} #{item}"}
     
  end
    
end

order = Order.new
   order.start_statement
   items = gets.chomp.capitalize
    begin
      if $dishes.has_key?(items)
        puts "How many of those would you like?"
        amount = gets.to_i
        begin
        if amount.is_a?(Integer) && amount > 0
        else
          puts "Please enter a digit that is a valid quantity for #{items}"
          amount = gets.to_i
        end
      end until amount.is_a?(Integer) && amount > 0
        puts "Order for #{amount} #{items} has been placed. Would you like to order anything else?"
        order.add_item(items, amount)
        items = gets.chomp.capitalize
      else 
        puts "Sorry! Not a correct item from the menu. Enter one, or enter 'Finished' if you are done"
        items = gets.chomp.capitalize
      end
    end until items.capitalize == "Finished"
    order.end_statement
    
