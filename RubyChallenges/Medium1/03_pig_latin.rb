# Rule 1: If a word begins with a vowel sound, 
# add an "ay" sound to the end of the word.
# Rule 2: If a word begins with a consonant sound, 
# move it to the end of the word, and then add an "ay" 
# sound to the end of the word.

class PigLatin
  CONSONANT_WORD_BEGIN = /\b[b-df-hj-np-tv-z]/
  VOWEL_WORD_BEGIN = /\b[aeiou]/i
  def self.translate(string)
    words = string.split
    words.map! do |word|
      if word =~ VOWEL_WORD_BEGIN
        word + 'ay'
      else
        word[1..-1] + word[0] + 'ay'
      end
    end
    words.join(' ')
  end
end