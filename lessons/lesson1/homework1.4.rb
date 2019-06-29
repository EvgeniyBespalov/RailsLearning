puts "Enter a ..."
a = gets.chomp.to_f
puts "Enter b ..."
b = gets.chomp.to_f
puts "Enter c ..."
c = gets.chomp.to_f

d = b**2 - 4*a*c

if d < 0
  puts "The equation hasn't roots"
elsif d == 0
  puts "The roots is equals (x1 = x2) : #{(-b + Math.sqrt(d))/2*a}"
else
  puts "x1 = #{(-b + Math.sqrt(d))/2*a}"
  puts "x2 = #{(-b - Math.sqrt(d))/2*a}"
end
  
