# each.rb

def each(arr)
  for i in arr
    yield(i)
  end
  arr
end

# [1, 2, 3].each { |num| "do nothing" }

each([1, 2, 3]) { |num| puts num }

# model solution
def each(array)
  counter = 0

  while counter < array.size
    yield(array[counter])                           # yield to the block, passing in the current element to the block
    counter += 1
  end

  array                                             # returns the `array` parameter, similar in spirit to how `Array#each` returns the caller
end
