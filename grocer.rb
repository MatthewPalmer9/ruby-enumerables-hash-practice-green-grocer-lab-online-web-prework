def consolidate_cart(cart)
  newHash = {}
  cart.each(){ |element_hash| 
    element_name = element_hash.keys[0]
    element_value = element_hash.values[0]
    
    if newHash.has_key?(element_name)
      newHash[element_name][:count] += 1
    else
      newHash[element_name] = {
        :count => 1,
        :price => element_value[:price],
        :clearance => element_value[:clearance]
      }
    end
  }
  newHash
end

def apply_coupons(cart, coupons)
  coupons.each do |coupon|
    item = coupon[:item]
    if cart.has_key?(item)
      if cart[item][:count] >= coupon[:num] && !cart.has_key?("#{item} w/COUPON")
          cart["#{item} w/COUPON"] = {:price => coupon[:cost] / coupon[:num], :clearance => cart[item][:clearance], :count => coupon[:num]}
          cart[item][:count] -= coupon[:num]
      elsif cart[item][:count] >= coupon[:num] && cart.has_key?("#{item} w/COUPON")
          cart["#{item} w/COUPON"][:count] += coupon[:num]
      end
      cart[item][:count] -= coupon[:num]
    end 
  end
  cart
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
