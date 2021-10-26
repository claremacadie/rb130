# reduce.rb

# simple version
# def reduce(arr, start_val = 0)
#   acc = start_val
#   for i in arr
#     acc = yield(acc, i)
#   end
#   acc
# end

# array = [1, 2, 3, 4, 5]

# p (reduce(array) { |acc, num| acc + num })                    # => 15
# p (reduce(array, 10) { |acc, num| acc + num })                # => 25
# p (reduce(array) { |acc, num| acc + num if num.odd? })        # => NoMethodError: undefined method `+' for nil:NilClass

# further exploration
def reduce(array, default=nil)
  array_clone = array.clone
  counter = 0
  
  if default
    accumulator = default
  else
    accumulator = array_clone.shift
  end

  while counter < array_clone.size
    accumulator = yield(accumulator, array_clone[counter])
    counter += 1
  end

  accumulator
end

p (reduce(['a', 'b', 'c']) { |acc, value| acc += value })
p (reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value })


# # model solution
# def reduce(array, default=0)
#   counter = 0
#   accumulator = default

#   while counter < array.size
#     accumulator = yield(accumulator, array[counter])
#     counter += 1
#   end

#   accumulator
# end