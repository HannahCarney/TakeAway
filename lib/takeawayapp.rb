require 'rubygems'
require 'twilio-ruby'
require_relative 'takeaway'
require_relative 'secret_phone_files'
# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid =  'ACef515c8867ccc758530aefeecc8a73ef'
auth_token = 'aaebb47b0123f8b8c80d39e958708f2f'
@client = Twilio::REST::Client.new account_sid, auth_token
 
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
          if number == order.cost(items, amount)
            order.add_item(items, amount)
            puts "Order for #{amount} #{items} has been placed. Would you like to order anything else? Enter 'Finished' if done."
          
          else
            puts "You haven't entered the correct cost. The cost is #{order.cost(items, amount)}"
            
          end
        end until number == order.cost(items, amount)
        items = gets.chomp.capitalize
      else 
        puts "Sorry! Not a correct item from the menu. Enter one, or enter 'Finished' if you are done"
        items = gets.chomp.capitalize
      end
    end until items.capitalize == "Finished"
    order.end_statement 


    message = @client.account.messages.create(:body => "Thank you for ordering! Your food will be delivered before #{Time.new.hour + 1 > 12 ? (Time.new.hour + 1) - 12 : Time.new.hour + 1}:#{Time.new.min < 10 ? (sprintf '%02d', Time.new.min) : Time.new.min} #{Time.new.hour > 12 ? 'PM' : 'AM'} (GMT).",
      :to => $number ,     # Can I get it to call a method?
    :from => "+441761502042")   
