class BeerSong
  BEER_VERSE = "NUMBER_BOTTLES of beer on the wall, NUMBER_BOTTLES of beer.\n" \
  "Take one down and pass it around, NUMBER_BOTTLES of beer on the wall.\n"
  
  LAST_VERSE = "No more bottles of beer on the wall, no more bottles of beer.\n" \
  "Go to the store and buy some more, 99 bottles of beer on the wall.\n"

  def verse(number)
    puts BEER_VERSE.gsub('NUMBER_BOTTLES', bottle_phrase(number) )
  end

  def bottle_phrase(number)
    str = "#{number} bottle"
    str << 's' if number > 1
  end

  def lyrics

  end
end