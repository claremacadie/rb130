# Examples from lesson 1

# def echo_with_yield(str)
#   yield if block_given?
#   str
# end

# puts echo_with_yield("Hello")
# puts echo_with_yield("Hello") { puts "World" }


# # method implementation
# def say(words)
#   yield if block_given?
#   puts "> " + words
# end

# # method invocation
# say("hi there") do
#   system 'clear'
# end


# # method implementation
# def increment(number)
#   if block_given?
#     yield(number + 1)
#   end
#   number + 1
# end

# # method invocation
# increment(5) do |num|
#   puts num
# end


# # method implementation
# def compare(str)
#   puts "Before: #{str}"
#   after = yield(str)
#   puts "After: #{after}"
# end

# # method invocation
# compare('hello') { |word| word.upcase }
# compare('hello') { |word| word.slice(1..2) }
# compare('hello') { |word| "nothing to do with anything" }
# compare('hello') { |word| puts "hi" }


# # method implementation
# def time_it
#   time_before = Time.now
#   yield
#   time_after = Time.now
  
#   puts "It took #{time_after - time_before} seconds."
# end

# # method invocation
# time_it { sleep(3) }
# time_it { "hello world" }


# # method implementation
# def test(&block)
#   puts "What's &block? #{block}"
# end

# # method invocation
# test { sleep(1) }


# # method implementation
# def test2(block)
#   puts "hello"
#   block.call
#   puts "good-bye"
# end

# def test(&block)
#   puts "1"
#   test2(block)
#   puts "2"
# end

# # method invocation
# test { puts "xyz" }


# # method implementation
# def display(block)
#   block.call(">>>")
# end

# def test(&block)
#   puts "1"
#   display(block)
#   puts "2"
# end

# # method invocation
# test { |prefix| puts prefix + "xyz" }


# # method implementation
# def for_each_in(arr)
#   arr.each { |element| yield element }
# end

# arr = [1, 2, 3, 4, 5]
# results = [0]

# # method invocation
# for_each_in(arr) do |number|
#   total = results[-1] + number
#   results.push(total)
# end

# p results


# def sequence
#   counter = 0
#   Proc.new { counter += 1 }
# end

# s1 = sequence
# p s1.call           # => 1
# p s1.call           # => 2
# p s1.call           # => 3
# puts

# s2 = sequence
# p s2.call           # => 1
# p s1.call           # => 4 (note: this is s1)
# p s2.call           # => 2


# name = 'a'
def n(name)
  puts name
end

name = 'b'

n(name)
