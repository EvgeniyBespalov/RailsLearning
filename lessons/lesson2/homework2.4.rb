vowels = Hash.new{}

('a'..'z').each.with_index { |letter, index| vowels[letter] = index + 1 if ("aeiou".include?(letter)) }

puts vowels
