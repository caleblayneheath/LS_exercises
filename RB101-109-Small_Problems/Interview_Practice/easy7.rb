=begin
input: two arrays, nonempty and the same size
output: one array, with elements from both arrays placed in alternating order
1st from arr1, 1st from arr2, 2nd from arr1, etc.



=end

def interleave(arr1, arr2)
  arr1.zip(arr2).flatten
end

p interleave([1, 2, 3], ['a', 'b', 'c']) #== [1, 'a', 2, 'b', 3, 'c']

=begin
input: string
output: hash with format lowercase:, uppercase:, neither:, where values
are count of letters appropriate to key

empty string should return zeros for all hash

create reference string of all letters in lowercase
define hash with all 3 cases as keys and values set to zero

find coutn of all lowercase chars
  array.count(alpha)
  put val in hash
find all uppercase chars
  arra.count(alpha.upcase)
  put val in hash
find all neithers
  take total and subtract sum of lower+uppercase chars
  string.size - hash[lowercase] - hash[uppercase
  put val in hash

=end


def letter_case_count(str)
  alpha = ('a'..'z').to_a.join
  results = {lowercase: 0, uppercase: 0, neither: 0}
  
  results[:lowercase] = str.count(alpha)
  results[:uppercase] = str.count(alpha.upcase)
  results[:neither] = str.size - results[:lowercase] - results[:uppercase]
  results
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

=begin
input: a string
output: new string, where each word has its first letter upcased
and all the rest downcased

words in quotation marks shouldn't be modified
word is any sequency of non blank char

split string in array of words
transform array of words
  word.capitalize unless word[0] is a quotation mark
  
return transformed array joined into a string

=end

def word_cap(str)
  str.split.map do |word|
    # (word[0] == '"' || word[0] == "'") ? word : word.capitalize
    word.capitalize
  end.join(' ')
end


p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

=begin

input: take a string
output: new string where every case is swapped for letters

define reference string which has all the lowercase letters
define another string for the uppercase letters
creat empty result string
iterate through every letter in the string
  if lowercase reference includes the letter, makeupper
  if uppercase reference includes the letter, makelower
  then append leter to empty result string
return result string

=end

def swapcase(str)
  lower_alpha = ('a'..'z').to_a.join
  upper_alpha = lower_alpha.upcase
  
  result = ''
  str.each_char do |char|
    if lower_alpha.include?(char)
      result << char.upcase
    elsif upper_alpha.include?(char)
      result << char.downcase
    else
      result << char
    end
  end
  result
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'