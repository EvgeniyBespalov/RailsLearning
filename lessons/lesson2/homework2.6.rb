products = Hash.new

loop do
puts "Enter product name (enter stop to exit)"
product = gets.chomp.downcase

break if product == "stop"

puts "Enter product price"
price = gets.chomp.to_f

puts "Enter product quantity"
quantity = gets.chomp.to_f

  if (products.key?(product))
    if (products[product].key?(price))
      products[product][price] += quantity
    else
      products[product][price] = quantity
    end
  else
    products[product] = {price => quantity}
  end
end

puts products

product_costs = Hash.new

products.each{|k, v| product_costs[k] = v.map{|p, q| p*q}.sum.round(2) }

product_costs.each{|k, v| puts "#{k} - #{v}"}

puts "All costs = #{product_costs.map{|k, v| v}.sum.round(2)}"
