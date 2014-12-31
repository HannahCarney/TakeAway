
  


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

  def cost(items, amount)
      amount*$dishes[items].to_i
  end

  def delivery_time
      puts "Thank you for ordering! Your food will be delivered before #{Time.new.hour + 1 > 12 ? (Time.new.hour + 1) - 12 : Time.new.hour + 1}:#{Time.new.min < 10 ? (sprintf '%02d', Time.new.min) : Time.new.min} #{Time.new.hour > 12 ? 'PM' : 'AM'} (GMT)."
  end

  def end_statement
     puts "#{self.delivery_time}You have ordered #{self.item_count} categories of food:"  
     self.quantity.each {|quantity, item| puts "#{quantity}: #{@items.shift}"} #have to make sure a new imput of the same food goes to the same array
  
  end

    
end


 
   
