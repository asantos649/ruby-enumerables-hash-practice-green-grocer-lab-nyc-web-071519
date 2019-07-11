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
  new_hash = cart
  coupon_list = {}
  cart.each {|key, value|
    counter = 0
    while coupons[counter] do
      if coupons[counter][:item] == key
        new_hash[key][:count] -= coupons[counter][:num]
        if coupon_list["#{key} W/COUPON"]
          coupon_list["#{key} W/COUPON"][:count] += coupons[counter][:num]
        else
          coupon_list["#{key} W/COUPON"]= {:price => coupons[counter][:cost]/coupons[counter][:num], :clearance => new_hash[key][:clearance], :count => coupons[counter][:num]}
        end 
       # return coupon_list
      end
      counter +=1 
    end 
  }
  new_hash.merge(coupon_list)
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
