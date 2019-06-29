puts "What is your name?"
name = gets.chomp
puts "What is your growth?"
ideal_weight  = gets.chomp.to_i - 110

if (ideal_weight < 0) 
	puts "#{name}, your weight is optimal"
elsif 
	puts "Your ideal weight is #{ideal_weight}"
end