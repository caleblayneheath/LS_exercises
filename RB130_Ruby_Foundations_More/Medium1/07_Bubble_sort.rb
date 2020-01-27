# my_solution
def bubble_sort!(arry)
  last = arry.size - 1
  loop do
    swapped = false
    (1..last).each do |idx|
      if default.call #arry[idx - 1] > arry[idx]
        arry[idx - 1], arry[idx] = arry[idx], arry[idx - 1]
        swapped = true
      end
    end  
    last -= 1
    break unless swapped 
  end
end

# def bubble_sort!(array)
#   loop do
#     swapped = false
#     1.upto(array.size - 1) do |index|
#       next if array[index - 1] <= array[index]
#       array[index - 1], array[index] = array[index], array[index - 1]
#       swapped = true
#     end

#     break unless swapped
#   end
#   nil
# end

array = [5, 3]
bubble_sort!(array)
p array #== [3, 5]

array = [5, 3, 7]
bubble_sort!(array) { |first, second| first >= second }
p array #== [7, 5, 3]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = [6, 12, 27, 22, 14]
bubble_sort!(array) { |first, second| (first % 7) <= (second % 7) }
p array == [14, 22, 12, 6, 27]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array) { |first, second| first.downcase <= second.downcase }
p array == %w(alice bonnie Kim Pete rachel sue Tyler)