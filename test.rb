first_list = [
  {"AVOCADO" => {:price => 3.00, :clearance => true }},
  {"AVOCADO" => {:price => 3.00, :clearance => true }},
  {"KALE"    => {:price => 3.00, :clearance => false}}
]

coupon = [{:item => "AVOCADO", :num => 1, :cost => 5.00}]

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

new_cart =  consolidate_cart(first_list)

def apply_coupons(cart, coupons)
  new_hash = cart
  count = 0
  temp_array = []
  coupons.map {|discount|
    cart.each {|key, value|
      if discount[:item] == key
        temp_array.push(discount)
 #       return new_hash[key][:count] 
        if new_hash[key][:count] < discount[:num]
          new_hash[key][:count] = 0
        else
          new_hash[key][:count] -= discount[:num]
        end
      end
    count += 1  
    }
  }
  new_hash
  
  
  
  
  
  
#  temp_array.map{|coup|
#    new_hash["#{coup[:item]} /W COUPON"] = {:price => 0, :clearance => false, :count => 0}
#  }
  return new_hash
end

puts apply_coupons(new_cart, coupon)

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
