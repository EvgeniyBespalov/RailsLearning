puts "Enter year"
year = gets.chomp.to_i

puts "Enter month"
month = gets.chomp.to_i

puts "Enter day"
day = gets.chomp.to_i

days_in_month = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

(1..month - 1).each{ |m| day += days_in_month[m]}

day += 1 if (month > 2 && year%4 == 0)

puts day



