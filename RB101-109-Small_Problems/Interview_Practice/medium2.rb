
=begin
input: string
output: true if the string can be made with all of the linked blocks
flase otherwise


blocks
B:O   X:K   D:Q   C:P   N:A
G:T   R:E   F:S   J:W   H:U
V:I   L:Y   Z:M

create a collection holding the blocks
  ['BO', 'GT', 'RE' ]
for each letter in the string
  check if block is in collection
    block.include?(char.upcase)
    if yes? remove block with delete
    if no, return false
    
return true after every letter has been examined


=end

def block_word?(str)
  blocks = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM)
  
  str.each_char do |char|
    block_to_delete = ''
    blocks.each do |block|
      block_to_delete = block if block.include?(char.upcase)
    end
    blocks.delete(block_to_delete)  
    return false if block_to_delete == ''
  end
  
  true
end


p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true

=begin
input: string of at least one char
output: hash of format { lowercase: %, uppercase: %, neither: % } 
round to one demical place

get count of string size

for each char in the string
  see if char in lowercase alphabet
    yes: incrmenet lowercase count
  see if char in uppercase alphabet
    yes: incrmenet lowercase count


get count of neithers
  total size - upper and lowercases

calculate percentages to put in the hash
  (( count / size) * 100).round(1)


=end

def letter_percentages(str)
  down_alpha = ('a'..'z').to_a.join
  up_alpha = down_alpha.upcase
  
  total = str.size
  up_count = 0
  down_count = 0
  
  str.each_char do |char|
    up_count += 1 if up_alpha.include?(char)
    down_count += 1 if down_alpha.include?(char)
  end
  
  neither_count = total - up_count - down_count
  
  {lowercase:to_percentage(down_count, total) , uppercase:to_percentage(up_count, total) , neither:to_percentage(neither_count, total) }
    
end

def to_percentage(num, div)
  ((num / div.to_f) * 100)
end


p letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }


=begin
input: string
output: true if all parens are matching, false otherwise

all balanced parens start with ( and are balanced by )
) can never occur first
you must equal numbers of ( and )
if there are ever more right parens at any given minute, not valid

set count to one
for each char in the string
  for each (
    we add one to a counter
  for each )
    we remove one from the counter
  if count ever goes below zero in loop
    return false

at end return true if count is zero


=end

def balanced?(str)
  count = 0
  str.each_char do |char|
    count += 1 if char == '('
    count -= 1 if char == ')'
    return false if count < 0
  end
  count == 0
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false


=begin
input: 3 numbers, each the length of a triangle side
output: symbol showing triangle type by side length, or invalid

triangle rules
sum of two shortest sides must be longer than the longest side
all sides must be greater than 0

equilater rules
all sides are same length

isoc rules
two sides are same length

scalene
valid and not isoc or equilateral


check if triangle valid
  if no, return invalid
  if yes,
    
    check to see if equil, isoc or scalene
      if 1 uniq value, equal
      if 2 uniq values, isoc
      else scalene

=end


def triangle(s1, s2, s3)
  sides = [s1, s2, s3].sort
  
  return :invalid if sides.include?(0) || sides[0..1].sum <= sides.last
  
  case sides.uniq.size
  when 1 then :equilateral
  when 2 then :isoceles   
  when 3 then :scalene  
  end
end

p triangle(3, 3, 3) #== :equilateral
p triangle(3, 3, 1.5) #== :isosceles
p triangle(3, 4, 5) #== :scalene
p triangle(0, 3, 3) #== :invalid
p triangle(3, 1, 1) #== :invalid



=begin
input: 3 nums which are angles of a triangle
output: symbol showing if tri is acutre right obtuse or invalid

valid angles
  sum to 180 && greater than 0

acute
  if all angles are less than 90
  
obtuse
  if one angle is greater than 90
  
right
  if one angle is 90


=end


def triangle(a1, a2, a3)
  angles = [a1, a2, a3]
  
  return :invalid unless angles.sum == 180 && angles.all?{ |a| a > 0}
  
  case
  when angles.all? { |a| a < 90 }
    :acute
  when angles.count(90) == 1
    :right
  else
    :obtuse
  end
  
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid


