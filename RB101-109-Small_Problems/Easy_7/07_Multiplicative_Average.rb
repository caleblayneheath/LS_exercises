def show_multiplicative_average(array)
  # multiply all numbers together
  product = array.inject(&:*)
  # divide result by number of array entries
  product = product / array.size.to_f
  puts product
  # print result to 3 decimal places

end

show_multiplicative_average([3, 5])
# The result is 7.500

show_multiplicative_average([6])
# The result is 6.000

show_multiplicative_average([2, 5, 7, 11, 13, 17])
# The result is 28361.667