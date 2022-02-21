#livecode 2 - le wagon market

market = {
    'ps5' => 1000,
    'switch' => 300,
    'gameboy' => 30
  }
  
  #added hash 'stock' with item's q-ty
  stock = {
    'ps5' => 10,
    'switch' => 8,
    'gameboy' => 5
  }
  
  cart = {}
  puts '🕹 Welcome to Le Wagon market !! 🕹'
  puts "======\n\n"
  
  puts 'In store today:'
  market.each do |item, price|
      puts "#{item} - #{price} Eur"
  end
  
  #defined all buy/add logic in the method 'buyadd'
  def buyadd(market1, stock1, cart1, name, qty, choice)
    if market1.key?(name) 
      if stock1[name].to_i >= qty.to_i
         # adding the item to the cart
         stock1[name] -= qty.to_i
         if choice == "buy"
          cart1[name] = qty.to_i
          puts "#{name} added to your cart! 👏  \n\n"
         else 
          cart1[name] += qty.to_i
          puts "You added #{qty} pcs to #{name}! 👏  \n\n"
         end
         # Displaying the content of the cart
         puts 'Your cart right now:'
         cart1.each do |item, quantity|
             puts "#{item}: #{quantity} pc(s)"
         end
      else
        if stock1[name] > 0
        puts "Available stock is #{stock1[name]} pcs."
        else 
        puts "Stock is empty please try next time"
        end
      end
    else
      puts "Sorry, we don't have that in store 😭"
    end
  end
  
  # loop starts
  user_choice = ''
  until user_choice == 'checkout' # user decides to checkout
      puts 'What would you like to do now? buy | add | checkout'
      user_choice = gets.chomp
  
      if user_choice == 'buy'
          puts 'What would you like to buy?'
          print '> '
          item_to_buy = gets.chomp
          if cart.key?(item_to_buy) 
            puts "Item is already in your cart, please choose 'add' if you want to increase qty of same item"
          else 
          puts 'How many would you like to buy?'
          qty_to_buy = gets.chomp
          buyadd(market, stock, cart, item_to_buy, qty_to_buy, user_choice)
          end
  
      elsif user_choice == 'add'
        puts 'What would you like to add to cart?'
          print '> '
          item_to_add = gets.chomp
          if cart.key?(item_to_add)
            puts 'How many would you like to add to cart?'
            print '> '
            qty_to_add = gets.chomp
            buyadd(market, stock, cart, item_to_add, qty_to_add, user_choice)
          else
            puts "Please choose 'buy' to initially add item to the cart "
          end
        
      elsif user_choice == 'checkout'
          puts 'Thanks for shopping with us!'
      else
          puts 'Sorry, that is not a valid option'
      end
  end
  
  
  
  
  
  
  
  
  