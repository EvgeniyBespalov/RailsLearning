products = {}

loop do
  puts "Enter product name (enter stop to exit)"
  product = gets.chomp

  break if product == "stop"

  puts "Enter product price"
  price = gets.chomp.to_f

  puts "Enter product quantity"
  quantity = gets.chomp.to_f
end
products[product] = {price: price}
products[product][:quantity] = quantity

puts products

product_costs = {}

products.each{|k, v| product_costs[k] = v[:price] * v[:quantity] }

product_costs.each{|k, v| puts "#{k} - #{v}"}

puts "All costs = #{product_costs.map{|k, v| v}.sum.round(2)}"
