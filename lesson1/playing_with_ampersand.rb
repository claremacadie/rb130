# testing_ampersand.rb

# This file is to figure out when & needs to be used for blocks

# def display(&block) # raises ArgumentError if & is used here
def display(block) # raises ArgumentError if & is used here
                    # unless & is also used in test method display(&block)
  block.call(">>>") 
end

def test(&block)
  puts "1"
  # display(&block)
  display(block)
  puts "2"
end

test { |prefix| puts prefix + "xyz" }