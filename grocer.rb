def consolidate_cart(cart)
  temp_cart = cart.uniq 
  new_hash={}
  counter=0
  while temp_cart[counter] do
    cart.map {|item|
      if temp_cart[counter].keys == item.keys
        new_hash[item.keys[0]] = item[item.keys[0]]
#      else
#        new_hash[item.keys] = item.values
      end 
    }
    counter += 1
  end 
  new_hash.each {|key, value|
    value[:count] = 0
  }
  
  counter2 = 0
  while cart[counter2] do
    new_hash.each {|key2, value2|
      if cart[counter2]
        value2[:count] += 1
      end 
      counter2 +=1 
    }
  end 
  return new_hash
end

def apply_coupons(cart, coupons)
  coupons.map {|discount|
    
    cart.each {|key, value|
      if discount[:item]
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
