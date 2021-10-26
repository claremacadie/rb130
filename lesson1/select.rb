# select.rb

def select(arr)
  new_array = []
  
  for i in arr
    new_array << i if yield(i)
  end
  
  new_array
end


array = [1, 2, 3, 4, 5]

p select(array) { |num| num.odd? }      # => [1, 3, 5]
p select(array) { |num| puts num }      # => [], because "puts num" returns nil and evaluates to false
p select(array) { |num| num + 1 }       # => [1, 2, 3, 4, 5], because "num + 1" evaluates to true

# # model solution
# def select(array)
#   counter = 0
#   result = []

#   while counter < array.size
#     current_element = array[counter]
#     result << current_element if yield(current_element)
#     counter += 1
#   end

#   result
# end