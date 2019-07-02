vowels = Hash.new
('a'..'z').each.with_index{|l,index| vowels[l] = index + 1 if ("aeiou".include?(l)) }
puts vowels
