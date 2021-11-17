# playing_with_returning_closures.rb

# This file is to understand methods and blocks returning closures

def sequence
  counter = 0
  Proc.new { counter += 1 }
end

s1 = sequence
p s1.call
p s1.call

s2 = sequence
p s2.call
p s1.call