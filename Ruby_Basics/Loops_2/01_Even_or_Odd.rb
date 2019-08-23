count = 1

loop do
  case count % 2
  when 1
    puts "#{count} is odd!"
  else 0
    puts "#{count} is even!"
  end
  count += 1
  break if count == 6
end