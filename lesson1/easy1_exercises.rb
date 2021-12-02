# easy1_exercises.rb

# # 1. Enumerable class creation

# class Tree
#   include Enumerable
  
#   def each
    
#   end
# end

# # 2. Optional blocks

# def compute(a = nil)
#   if block_given?
#     yield(a)
#   else
#     'Does not compute.'
#   end
# end

# p compute { 5 + 3 } == 8
# p compute { 'a' + 'b' } == 'ab'
# p compute == 'Does not compute.'
# p compute(4) { |n| n } == 4
# p compute(99) { |n| 100 + n } == 199
# p compute("hello") { |n| "#{n} world" } == "hello world"


# # 3. Find Missing Numbers

# def missing(arr)
#   first = arr[0]
#   last = arr[-1]
#   new = []
  
#   for i in first..last
#     new << i unless arr.include?(i)
#   end
  
#   new
# end

# p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
# p missing([1, 2, 3, 4]) == []
# p missing([1, 5]) == [2, 3, 4]
# p missing([6]) == []


# # 4. Divisors

# def divisors(num)
#   result = []
  
#   for i in 1..(Math.sqrt(num))
#     if num % i == 0
#       result << i
#       result << (num / i)
#     end
#   end
  
#   p result
# end

# p divisors(1) == [1]
# p divisors(7) == [1, 7]
# p divisors(12) == [1, 2, 3, 4, 6, 12]
# p divisors(98) == [1, 2, 7, 14, 49, 98]
# p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute


# # 5. Encrypted pioneets

# # Create a method that takes a string and returns a new string with each of the letters moved 13 places.
# # Preserve case
# # Create a hash to convert each letter
#   # Create array of letters and new letters
#   # Iterate from 1 to 52 to create hash
# # Transform each letter in the input string according to the hash

# ENCRYPTED_PIONEERS = [
#   'Nqn Ybirynpr',
#   'Tenpr Ubccre',
#   'Nqryr Tbyqfgvar',
#   'Nyna Ghevat',
#   'Puneyrf Onoontr',
#   'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
#   'Wbua Ngnanfbss',
#   'Ybvf Unvog',
#   'Pynhqr Funaaba',
#   'Fgrir Wbof',
#   'Ovyy Tngrf',
#   'Gvz Orearef-Yrr',
#   'Fgrir Jbmavnx',
#   'Xbaenq Mhfr',
#   'Fve Nagbal Ubner',
#   'Zneiva Zvafxl',
#   'Lhxvuveb Zngfhzbgb',
#   'Unllvz Fybavzfxv',
#   'Tregehqr Oynapu'
# ].freeze

# def rot13(arr)
#   letters = ('A'..'Z').to_a + ('a'..'z').to_a
#   rotated_letters = ('A'..'Z').to_a.rotate(13) + ('a'..'z').to_a.rotate(13)
#   code_breaker = {' ' => ' ', '-' => '-'}
#   0.upto(51) do |idx|
#     code_breaker[letters[idx]] = rotated_letters[idx]
#   end

#   arr.each do |str|
#     puts (str.chars.map { |char| code_breaker[char] }.join('') )
#   end
# end

# rot13(ENCRYPTED_PIONEERS)


# # 6. Iterators: True for Any?

# def any?(arr)
#   arr.each do |element|
#     return true if yield(element)
#   end
  
#   false
# end

# p any?([1, 3, 5, 6]) { |value| value.even? } == true
# p any?([1, 3, 5, 7]) { |value| value.even? } == false
# p any?([2, 4, 6, 8]) { |value| value.odd? } == false
# p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
# p any?([1, 3, 5, 7]) { |value| true } == true
# p any?([1, 3, 5, 7]) { |value| false } == false
# p any?([]) { |value| true } == false


# # 7. Iterators: True for All?

# def all?(arr)
#   arr.each do |item|
#     return false unless yield(item)
#   end
#   true
# end

# p all?([1, 3, 5, 6]) { |value| value.odd? } == false
# p all?([1, 3, 5, 7]) { |value| value.odd? } == true
# p all?([2, 4, 6, 8]) { |value| value.even? } == true
# p all?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
# p all?([1, 3, 5, 7]) { |value| true } == true
# p all?([1, 3, 5, 7]) { |value| false } == false
# p all?([]) { |value| false } == true


# 8. Iterators True for None?

# def none?(arr)
#   arr.each do |item|
#     return false if yield(item)
#   end
#   true
# end

# model solution

def any?(arr)
  arr.each do |element|
    return true if yield(element)
  end
  
  false
end

def none?(collection, &block)
  !any?(collection, &block)
end

p none?([1, 3, 5, 6]) { |value| value.even? } == false
p none?([1, 3, 5, 7]) { |value| value.even? } == true
p none?([2, 4, 6, 8]) { |value| value.odd? } == true
p none?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
p none?([1, 3, 5, 7]) { |value| true } == false
p none?([1, 3, 5, 7]) { |value| false } == true
p none?([]) { |value| true } == true


# # 9. Iterators: True for One?

# def one?(arr)
#   counter = 0
  
#   arr.each do |item|
#     counter += 1 if yield(item)
#     return false if counter > 1
#   end
  
#   counter == 1 ? true : false
# end

# p one?([1, 3, 5, 6]) { |value| value.even? }    # -> true
# p one?([1, 3, 5, 7]) { |value| value.odd? }     # -> false
# p one?([2, 4, 6, 8]) { |value| value.even? }    # -> false
# p one?([1, 3, 5, 7]) { |value| value % 5 == 0 } # -> true
# p one?([1, 3, 5, 7]) { |value| true }           # -> false
# p one?([1, 3, 5, 7]) { |value| false }          # -> false
# p one?([]) { |value| true }                     # -> false


# # 10. Count items

# # def count(arr)
# #   counter = 0
  
# #   arr.each do |item|
# #     counter += 1 if yield(item)
# #   end
  
# #   counter
# # end

# # solution without inbuilt iterator

# def count(arr)
#   count = 0
  
#   for i in arr
#     count += 1 if yield(i)
#   end
  
#   count
# end

# p count([1,2,3,4,5]) { |value| value.odd? } == 3
# p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
# p count([1,2,3,4,5]) { |value| true } == 5
# p count([1,2,3,4,5]) { |value| false } == 0
# p count([]) { |value| value.even? } == 0
# p count(%w(Four score and seven)) { |value| value.size == 5 } == 2

