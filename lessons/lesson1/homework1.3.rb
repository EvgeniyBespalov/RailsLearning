puts "What is length side one?"
side_a = gets.chomp.to_f

puts "What is length side two?"
side_b = gets.chomp.to_f

puts "What is length side three?"
side_c = gets.chomp.to_f

a, b, h = [side_a, side_b, side_c].sort

if a == h
  puts "Triangle is equilateral and isosceles but triangle isn't rectangular"
else
  pifagor = h**2 == a**2 + b**2

  if pifagor
    if a == b
      puts "Triangle is rectangular and isosceles"
    else
      puts "Triangle is rectangular"
    end
  elsif a == b
    puts "Triangle is isosceles"
  else
    puts "Triangle isn't rectangular or isosceles or equilateral"
  end
end
