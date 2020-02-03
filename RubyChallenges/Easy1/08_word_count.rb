class Phrase
  def initialize(phrase)
    @phrase = phrase
    @tokens = @phrase.split(/[ ,]/).map{ |word| word.gsub(/[!&@$%^&:.\n]/, '')}
    @tokens.reject! { |elem| elem == '' }
  end

  def word_count
    count = {}
    @tokens.map(&:downcase).uniq.each do |word|
      count[word.downcase] = @tokens.map(&:downcase).count(word.downcase)
    end
    count
  end

end