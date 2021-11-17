# medium1_exercises.rb

# # 1. Listening device

# class Device
#   def initialize
#     @recordings = []
#   end
  
#   def listen
#     if block_given?
#       recording = yield
#       record(recording)
#     end
#   end
  
#   def play
#     puts @recordings[-1]
#   end

#   def record(recording)
#     @recordings << recording
#   end
# end

# listener = Device.new
# listener.listen { "Hello World!" }
# listener.listen
# listener.play # Outputs "Hello World!"


# # 2. Text analyzer - Sandwich code

# class TextAnalyzer
#   def process
#     file = File.open("sample_text.txt")
#     file_data = file.read
#     yield(file_data)
#     file.close
#   end
# end

# analyzer = TextAnalyzer.new

# analyzer.process do |data| 
#   array = data.split("\n\n")
#   puts "#{array.size} paragraphs"
# end

# analyzer.process do |data| 
#   array = data.split("\n")
#   puts "#{array.size} lines"
# end

# analyzer.process do |data| 
#   array = data.split(" ")
#   puts "#{array.size} words"
# end

# # 3. Passing parameters part 1

# items = ['apples', 'corn', 'cabbage', 'wheat']

# def gather(items)
#   puts "Let's start gathering food."
#   yield(items)
#   puts "Nice selection of food we have gathered!"
# end

# gather(items) { |items| puts items.join(', ') }


# # 4. Passing parameters part 2

# birds = %w(raven finch hawk eagle)

# def types(arr)
#   yield(arr)
# end

# types(birds) do |_, _, *raptors|
#   p raptors
# end


# # 5. Passing parameters part 3

# items = ['apples', 'corn', 'cabbage', 'wheat']

# def gather(items)
#   puts "Let's start gathering food."
#   yield(items)
#   puts "We've finished gathering!"
# end

# gather(items) do |*veg, grain|
#   puts veg.join(', ') 
#   puts grain
# end
  
# gather(items) do |apples,*corn_and_cabbage, wheat|
#   puts apples
#   puts corn_and_cabbage.join(', ')
#   puts wheat
# end

# gather(items) do |apples, *other|
#   puts apples
#   puts other.join(', ')
# end

# gather(items) do |apples, corn, cabbage, wheat|
#   puts "#{apples}, #{corn}, #{cabbage}, and #{wheat}"
# end


# # 6. Method to proc

# def convert_to_base_8(n)
#   n.to_s(8).to_i # replace these two method calls
# end

# # The correct type of argument must be used below
# base8_proc = method(:convert_to_base_8).to_proc

# # We'll need a Proc object to make this code work. Replace `a_proc`
# # with the correct object
# p [8, 10, 12, 14, 16, 33].map(&base8_proc)


# # 7. Bubble sort with blocks

# def bubble_sort!(array)
#   loop do
#     swapped = false
#     1.upto(array.size - 1) do |index|
#       if block_given?
#         next if yield(array[index -1], array[index])
#       else  
#         next if array[index - 1] <= array[index]
#       end
#       array[index - 1], array[index] = array[index], array[index - 1]
#       swapped = true
#     end

#     break unless swapped
#   end
#   nil
# end

# array = [5, 3]
# bubble_sort!(array)
# p array == [3, 5]

# array = [5, 3, 7]
# bubble_sort!(array) { |first, second| first >= second }
# p array == [7, 5, 3]

# array = [6, 2, 7, 1, 4]
# bubble_sort!(array)
# p array == [1, 2, 4, 6, 7]

# array = [6, 12, 27, 22, 14]
# bubble_sort!(array) { |first, second| (first % 7) <= (second % 7) }
# p array == [14, 22, 12, 6, 27]

# array = %w(sue Pete alice Tyler rachel Kim bonnie)
# bubble_sort!(array)
# p array == %w(Kim Pete Tyler alice bonnie rachel sue)

# array = %w(sue Pete alice Tyler rachel Kim bonnie)
# bubble_sort!(array) { |first, second| first.downcase <= second.downcase }
# p array == %w(alice bonnie Kim Pete rachel sue Tyler)

# # 7. Further exploration

# def bubble_sort!(array)
#   loop do
#     swapped = false
#     1.upto(array.size - 1) do |index|
#       if block_given?
#         next if yield(array[index -1]) <= yield(array[index])
#       else
#         next if array[index - 1] <= array[index]
#       end
#       array[index - 1], array[index] = array[index], array[index - 1]
#       swapped = true
#     end

#     break unless swapped
#   end
#   nil
# end

# array = %w(sue Pete alice Tyler rachel Kim bonnie)
# bubble_sort!(array) { |value| value.downcase }
# p array == %w(alice bonnie Kim Pete rachel sue Tyler)