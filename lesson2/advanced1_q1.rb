# advanced1_q1.rb

# This is about internal v external iterators to illustrate Enumerator objects

=begin
Problem
Create a new Enumerator object.
Define what values are iterated upon
Create an Enumerator that ca iterate over an infinite list of factorials
Test the Enumerator by printing out the first 7 factorial values, starting
with 0!

After printing 7 factorials, print 3 more - they will be wrong.
Reset Enumerator, using #rewind.
Print 7 more factorials

Assumptions
0! = 1
1! = 1
2! = 2 * 1 = 2

Only require 3 Enumerator methods
An Enumerator implements the Enumerable module...


=end

# factorial = Enumerator.new do |yielder|
#   accumulator = 1
#   number = 0
#   loop do
#     accumulator = number.zero? ? 1 : accumulator * number
#     yielder << accumulator
#     number += 1
#   end
# end

# puts factorial.next
# puts factorial.next
# puts factorial.next
# puts factorial.next
# puts factorial.next
# puts factorial.next
# puts factorial.next
# puts factorial.next
# puts factorial.next
# puts factorial.next
# puts factorial.next
# puts factorial.next
# puts factorial.next


accumulator = 1
for i in 0..14
  if i == 0
    puts accumulator
  else
    accumulator *= i
    puts accumulator
  end
end



# When you include the Enumerable module, you need to provide an
# each method that is used by the Enumerable methods.
class Colors
  include Enumerable

  def each
    yield "red"
    yield "green"
    yield "blue"
  end
end

c = Colors.new
c.map { |i| i.reverse }
# => ["der", "neerg", "eulb"]

