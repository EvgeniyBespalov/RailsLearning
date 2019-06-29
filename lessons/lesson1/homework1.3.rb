puts "What is length side one?"
length_s1 = gets.chomp.to_f
puts "What is length side two?"
length_s2 = gets.chomp.to_f
puts "What is length side three?"
length_s3 = gets.chomp.to_f

if length_s1 == length_s2 && length_s1 == length_s3
  puts "Triangle is equilateral and isosceles but triangle isn't rectangular"
else
  pifagor_g1 = length_s1**2 == length_s2**2 + length_s3**2
  pifagor_g2 = length_s2**2 == length_s1**2 + length_s3**2
  pifagor_g3 = length_s3**2 == length_s1**2 + length_s2**2

if pifagor_g1 || pifagor_g2 || pifagor_g3
  if length_s1 == length_s2 || length_s1 == length_s3 || length_s2 == length_s3
    puts "Triangle is rectangular and isosceles"
  else
    puts "Triangle is rectangular"
  end
elsif length_s1 == length_s2 || length_s1 == length_s3 || length_s2 == length_s3
    puts "Triangle is isosceles"
  else
    puts "Triangle isn't rectangular or isosceles or equilateral"
  end
end
