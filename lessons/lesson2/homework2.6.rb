products = Hash.new

loop do
puts "Enter product name (enter stop to exit)"
product = gets.chomp.lowcase

break if product == "stop"

puts "Enter product price"
price = gets.chomp.to_f

puts "Enter product quantity"
quantity = gets.chomp.to_f

  if (products.key?(product))
    if (products[product].key?[price])
      products[product][price] += quantity
    else
      products[product][price] = quantity
    end
  else
    products[product] = {price => quantity}
  end
end