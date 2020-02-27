class WordProblem
  
  # takes string representing word problem
  # eg. what is 53 + 2
  # need to tokenize string
  # somehow search through string looking for numbers and operations
  # idea: create sometype of buffer, number operation number
  #   when buffer is full perform operaton and store result in first slot
  # alternative: strip away everything but numbers and operations,
  #   store result in array, walk through array storing operations  
  def initialize(string)
    numbers_operations_regex = /-?\d+|plus|minus|multiplied|divided/
    @tokens = string.scan(numbers_operations_regex)
    raise ArgumentError unless @tokens.size > 2
  end

  # provide answer to computation described in string
  # should raise ArgumentError if either
  #   string contains no numbers
  #   string does not contain added, subtracted, etc
  def answer
    operations = { 'plus' => '.+', 'minus' => '.-', 
                   'multiplied' => '.*', 'divided' => './' }
    problem = @tokens.map do |token|
      operations[token] ? operations[token] : "(#{token})"
    end.join
    eval(problem)
  end

end