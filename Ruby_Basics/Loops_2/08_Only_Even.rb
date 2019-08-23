number = 0

until number == 10
  number += 1
  next if number % 2 == 1
  puts number
end