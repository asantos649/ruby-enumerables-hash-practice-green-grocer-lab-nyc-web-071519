first_list =     [
      {"AVOCADO" => {:price => 3.00, :clearance => false}},
      {"KALE" => {:price => 3.00, :clearance => false}},
      {"BLACK_BEANS" => {:price => 2.00, :clearance => false}},
      {"ALMONDS" => {:price => 10.00, :clearance => false}},
      {"TEMPEH" => {:price => 3.00, :clearance => false}},
      {"CHEESE" => {:price => 6.00, :clearance => false}},
      {"BEER" => {:price => 13.00, :clearance => false}},
      {"BEER" => {:price => 1.00, :clearance => false}},
#      {"PEANUTBUTTER" => {:price => 3.00, :clearance => false}},
#      {"BEETS" => {:price => 2.00, :clearance => false}},
#      {"SOY MILK" => {:price => 4.00, :clearance => false}}
    ]

coupon = [
#      {:item => "AAVOCADO", :num => 2, :cost => 5.00},
#      {:item => "ABEER", :num => 2, :cost => 20.00},
#      {:item => "ACHEESE", :num => 3, :cost => 15.00}
    ]

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
      if (coupons[counter][:item] == key) #&& (coupons[counter][:num] >= new_hash[key][:count]) 
        new_hash[key][:count] -= coupons[counter][:num]
        if coupon_list["#{key} W/COUPON"]
          coupon_list["#{key} W/COUPON"][:count] += coupons[counter][:num]
        else
          coupon_list["#{key} W/COUPON"]= {:price => coupons[counter][:cost]/coupons[counter][:num], :clearance => new_hash[key][:clearance], :count => coupons[counter][:num]}
        end 
      
      end
      counter +=1 
    end 
  }
  new_hash.merge(coupon_list)
end

apply_coupons(first_list, coupon)


def apply_clearance(cart)
  cart.each{|key, value|
    if cart[key][:clearance]
      cart[key][:price] = (0.8 * cart[key][:price]).round(2)
    end
  }
  return cart
end

def checkout(cart, coupons)
  sum = 0
  new_cart1 = consolidate_cart(cart)
  new_cart2 = apply_coupons(new_cart1, coupons)
  new_cart3 = apply_clearance(new_cart2)
  new_cart3.each{|key,value|
    sum += (new_cart3[key][:price]*new_cart3[key][:count])
  }
  return sum
end

puts checkout(first_list, coupon)







