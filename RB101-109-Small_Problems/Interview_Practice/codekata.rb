# return array of suspects with illegal items in their pockets

=begin
input: hash pockets person: [array of nums], array of nums
output: array of symbols
  symbols return should be those keys which have values  in array of nums input
  
if no array of nums provided, return all names
if all objects found, retunr nil

create empty array suspects
iterate through hash
  if value of present key is in input array
    append key to suspects
return suspects

=end

def find_suspects(pockets, allowed_items)
  suspects = []
  pockets.each do |person, contents|
    unless contents.nil?
      contents.each do |item|
        suspects << person unless allowed_items.include?(item)
      end
    end
  end
  
  suspects.empty? ? nil : suspects.uniq

end

pockets = { 
  bob: [1],
  tom: [2, 5],
  jane: [7]
} 

p find_suspects(pockets, [1, 2]) # => [:tom, :jane]
p find_suspects(pockets, [1, 7, 5, 2]) # => nil
p find_suspects(pockets, []) # => [:bob, :tom, :jane]
p find_suspects(pockets, [7]) # => [:bob, :tom]


# -- DELETE A DIGIT
=begin
Task
Given an integer n, find the maximal number you can obtain 
by deleting exactly one digit of the given number.

Constraints: 10 ≤ n ≤ 1000000.

input: integer, at least two digits
output: integer with one digit deleted, that is as large as possible

turn number to string
get all substrings of size str.size-1
  start at 0..1, left is going from 0...-1

turn each substring to int
get then maximum value

=end

def delete_digit(num)
  substrings = []
  num_string = num.to_s
  (0...num_string.size).each do |digit|
    work_str = num_string.chars
    work_str.delete_at(digit)
    substrings << work_str.join
  end
  
  new_nums = substrings.map(&:to_i)
  new_nums.max
end

p delete_digit(152) # 52
p delete_digit(1001) # 101
p delete_digit(10) # 1

