puts "Enter a ..."
a = gets.chomp.to_f

puts "Enter b ..."
b = gets.chomp.to_f

puts "Enter c ..."
c = gets.chomp.to_f

d = b**2 - 4 * a * c

if d < 0
  puts "The equation hasn't roots"
else
  sqrt_d = Math.sqrt(d)
  x1 = (-b + sqrt_d)/(2 * a)
  
  if d == 0
    puts "The roots is equals (x1 = x2) : #{x1}"
  else
    puts "x1 = #{x1}"
    puts "x2 = #{(-b - sqrt_d)/(2 * a)}"
  end
end
