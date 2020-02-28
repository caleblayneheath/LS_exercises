class Crypto
  attr_reader :string
  
  def initialize(string)
    @string = string
  end

  def normalize_plaintext
    string.downcase.gsub( /[^a-z0-9]/,'')
  end

  def size
    Math.sqrt(normalize_plaintext.size).ceil
  end

  def plaintext_segments
    text_size = size
    text = normalize_plaintext
    segments = []
    until text.empty?
      segments << text.slice!(0, text_size)
    end
    segments
  end

  def ciphertext
    text_size = size
    text = plaintext_segments
    message = ''
    (0...text_size).each do |idx|
      text.each do |row|
        message << row[idx] if row[idx]
      end
    end
    message
  end

  def normalize_ciphertext
    text_size = size
    p text_size
    text = ciphertext
    segments = []
    until text.empty?
      segments << text.slice!(0, text_size)
    end
    segments.join(' ')
  end
end