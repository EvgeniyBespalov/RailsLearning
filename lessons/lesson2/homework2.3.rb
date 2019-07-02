fibo = [0, 1]
next_value = fibo[-1] + fibo[-2]

while next_value < 100
  fibo << next_value
  next_value = fibo[-1] + fibo[-2]
end

puts fibo