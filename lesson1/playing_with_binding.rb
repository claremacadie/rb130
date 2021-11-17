# playing_with_binding.rb

# This file is to understand binding in relation to closures

# def for_each_in(arr)
#   arr.each { |element| yield element }
# end

# arr = [1, 2, 3, 4, 5]
# results = [0]

# for_each_in(arr) do |number|
#   total = results[-1] + number
#   results.push(total)
# end

# p results

name = "Robert" # if this line is placed below chunk_of_code assignment, an error is raised

def call_me(some_code)
  some_code.call
end
chunk_of_code = Proc.new { puts name } # this line can be placed before of after the call me definition

name = "Griffin III" # if this line is placed below the call_me invocation, this reassignment is not reflected in the invocation
call_me(chunk_of_code)
