class Order
  
 $dishes = {"Soup" => 4, "Rice" => 2, "Pizza" => 8, "Curry" => 8, "Salad" => 5, "Chicken" => 4, "Beef" => 6}



  def start_statement
    puts "Hello, and welcome to TakeAway! Here is the menu:"
    $dishes.each {|key, value| puts "#{key}: $#{value}"}
    puts "Please pick an item from the menu by typing the menu item"
  end

  def ordered
    @items ||= [] 
   end

  def item_count
     @items.nil? ? 0 : @items.count
  end

  def add_item(items, amount)
    ordered << items
    quantity << amount
  end

  def quantity
     @quantity ||= []
  end

  def delivery_time
      puts "Thank you for ordering! Your Food will be delivered before #{Time.new.hour + 1 > 12 ? (Time.new.hour + 1) - 12 : Time.new.hour + 1}:#{Time.new.min < 10 ? (sprintf '%02d', Time.new.min).to_i : Time.new.min} #{Time.new.hour > 12 ? 'PM' : 'AM'} (GMT)."
  end

  def end_statement
     puts "#{self.delivery_time}You have ordered #{self.item_count} categories of food:"  
     self.quantity.each {|quantity, item| puts "#{quantity}: #{@items.shift}"} #have to make sure a new imput of the same food goes to the same array
     
  end
    
end

order = Order.new
   order.start_statement
   items = gets.chomp.capitalize
    begin
      if $dishes.has_key?(items.capitalize)
        puts "How many of those would you like?"
        amount = gets.to_i
        begin
        if amount.is_a?(Integer) && amount > 0
        else
          puts "Please enter a digit that is a valid quantity for #{items}"
          amount = gets.to_i
        end
      end until amount.is_a?(Integer) && amount > 0
        puts "Please confirm your order by typing in the total cost of the items"
       
        begin
           number = gets.to_i
          if number == amount*$dishes[items].to_i
            order.add_item(items, amount)
            puts "Order for #{amount} #{items} has been placed. Would you like to order anything else? Enter 'Finished' if done."
          
          else
            puts "You haven't entered the correct cost. The cost is #{amount*$dishes[items]}"
            
          end
        end until number == amount*$dishes[items].to_i
        items = gets.chomp.capitalize
      else 
        puts "Sorry! Not a correct item from the menu. Enter one, or enter 'Finished' if you are done"
        items = gets.chomp.capitalize
      end
    end until items.capitalize == "Finished"
    order.end_statement
    
