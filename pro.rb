
##########################################################################
# that, given an array A of N integers, returns the smallest positive integer (greater than 0) that does not occur in A.

# For example, given A = [1, 3, 6, 4, 1, 2], the function should return 5.

# Given A = [1, 2, 3], the function should return 4.

# Given A = [−1, −3], the function should return 1.

# Write an efficient algorithm for the following assumptions:

# N is an integer within the range [1..100,000];
# each element of array A is an integer within the range [−1,000,000..1,000,000].
#-------------------------------------------------------------------------
# SOLUTIONS 
#-------------------------------------------------------------------------
# you can write to stdout for debugging purposes, e.g.
# puts "this is a debug message"

# https://app.codility.com/demo/results/demo2JPDCY-6SY/
def solution(a)
  # write your code in Ruby 2.2
  a.sort!.uniq!
  maxi = a.last
  
  return 1 if maxi <= 0
  
  a.each_with_index do |num, i|
    # return num < 0 ? a[i+1] > 0 && a[i+1] != 1 ? 1 : next : a[i+1] != num+1 ? num+1 : next
    # [0,2,66] [2,4,5,6,7]
    if num < 0
      if a[1+i] > 0 && a[i+1] != 1 
        return 1
      else 
        next
      end
    end
    return num+1 if a[i+1] != num+1
  end
end
# https://app.codility.com/demo/results/demoD9QAPS-YS5/
def solution2(a)
    # write your code in Ruby 2.2
    maxi = a.max
    # puts "arr - #{a.inspect}  -- "
    return 1 if maxi <= 0
    mini = a.min 
    mini = mini <= 0 ? 1 : mini
    # puts "min - #{mini} - maxi - #{maxi} "
    (mini..maxi).each do |num|
      return num if !a.include?(num)
    end
    return maxi+1
  end

# https://app.codility.com/demo/results/demoXVQWFR-B85/
def solution1(a)
  # write your code in Ruby 2.2
  maxi = a.max
  return 1 if maxi <= 0
  (1..maxi).each do |num|
    return num if !a.include?(num)
  end
  return maxi+1
end

  a = [2,3,4,5,7]
  b = [0]
  c = [-4,54]
  d = [54,-34]
  e = [-34,0]
  f = [0,2,4,5,6]
  g = [23,34]
  h = [0,2,4,6]
  i = [1]
  j = [34]
  k = [1,43]
  l = [0,54]
  m = [100,0,2,260,3,4]
  n = Array(1..149)
  n.delete(3)
  n.delete(1)

 puts "a -->  #{solution(a) == 6}"
 puts "b -->  #{solution(b) == 3}"
 puts "c -->  #{solution(c) == 1}"
 puts "d -->  #{solution(d) == 1}"
 puts "e -->  #{solution(e) == 1}"
 puts "f -->  #{solution(f) == 1}"
 puts "g -->  #{solution(g) == 24}"
 puts "h -->  #{solution(h) == 1}"
 puts "i -->  #{solution(i) == 2}"
 puts "j -->  #{solution(j) == 35}"
 puts "k -->  #{solution(k) == 2}"
 puts "l -->  #{solution(l) == 1}"
 puts "m -->  #{solution(m) == 1}"
 puts "n -->  #{solution(n) == 3}"
####################################################################
# A non-empty array A consisting of N integers is given. The first covering prefix of array A is the smallest integer P such that 0≤P<N and such that every value that occurs in array A also occurs in sequence A[0], A[1], ..., A[P].

# For example, the first covering prefix of the following 5−element array A:

#   A[0] = 2
#   A[1] = 2
#   A[2] = 1
#   A[3] = 0
#   A[4] = 1
# is 3, because sequence [ A[0], A[1], A[2], A[3] ] equal to [2, 2, 1, 0], contains all values that occur in array A.


####################################################################
# A binary gap within a positive integer N is any maximal sequence of consecutive zeros
# that is surrounded by ones at both ends in the binary representation of N.

# For example, number 9 has binary representation 1001 and contains a binary gap of length 2.
# The number 529 has binary representation 1000010001 and contains two binary gaps: one of length 4 and one of length 3.
# The number 20 has binary representation 10100 and contains one binary gap of length 1. 
# The number 15 has binary representation 1111 and has no binary gaps. 
# The number 32 has binary representation 100000 and has no binary gaps.

# 9.to_s(2) #=> "1001"
# 4165.to_s(2) => "1000001000101"
# 1313 => 10100100001
# 1289 => 10100001001
n = 1289.to_s(2)

#or i could take the index of 1 and find difference between them
# { b: 1, a: 2 }.sort # will sort by key
# { c: 3, b: 1, a: 2 }.sort_by(&:last) # will sort by values
# defaults.merge!(preferences) { |key, old, new| [old, new].max }
max = n.scan(/1(0+)(?=1)/).flatten.max&.length 
puts max.nil? ? 0 : max

occur = 1289.to_s(2).chars.map.with_index { |c,i| i if c == "1" }.compact
occur.length > 1 ? occur.each_cons(2).map { |a,b| b-a }.max - 1 : 0


####################################################################

# that, given an array A consisting of N integers and an integer K, returns the array A rotated K times.

# For example, given

#     A = [3, 8, 9, 7, 6]
#     K = 3
# the function should return [9, 7, 6, 3, 8]. Three rotations were made:

#     [3, 8, 9, 7, 6] -> [6, 3, 8, 9, 7]
#     [6, 3, 8, 9, 7] -> [7, 6, 3, 8, 9]
#     [7, 6, 3, 8, 9] -> [9, 7, 6, 3, 8]
# For another example, given

#     A = [0, 0, 0]
#     K = 1
# the function should return [0, 0, 0]

# Given

#     A = [1, 2, 3, 4]
#     K = 4
# the function should return [1, 2, 3, 4]

# Assume that:

# N and K are integers within the range [0..100];
# each element of array A is an integer within the range [−1,000..1,000].
def pla(a,k)
  return a if a.length == k
  for i in 0...k
    last = a.pop
    a.unshift(last)
  end
  a
end
####################################################################
# A non-empty array A consisting of N integers is given. The array contains an odd number of elements, and each element of the array can be paired with another element that has the same value, except for one element that is left unpaired.

# For example, in array A such that:

#   A[0] = 9  A[1] = 3  A[2] = 9
#   A[3] = 3  A[4] = 9  A[5] = 7
#   A[6] = 9
# the elements at indexes 0 and 2 have value 9,
# the elements at indexes 1 and 3 have value 3,
# the elements at indexes 4 and 6 have value 9,
# the element at index 5 has value 7 and is unpaired.
# Write a function:

# def solution(a)

# that, given an array A consisting of N integers fulfilling the above conditions, returns the value of the unpaired element.

# For example, given array A such that:

#   A[0] = 9  A[1] = 3  A[2] = 9
#   A[3] = 3  A[4] = 9  A[5] = 7
#   A[6] = 9
# the function should return 7, as explained in the example above.

# Write an efficient algorithm for the following assumptions:

# N is an odd integer within the range [1..1,000,000];
# each element of array A is an integer within the range [1..1,000,000,000];
# all but one of the values in A occur an even number of times.
# fifa = Hash.new([])
# fifa[k].push(val)
a = [9,3,9,3,9,7,9]
occur = Hash.new(0)
# occur.default(0)
a.each { |n| occur[n] = occur[n] + 1  }
# a.each { |n| occur[n] = (occur[n] || 0) + 1  }
occur.select{|k,v| v.odd?}.keys.first

####################################################################
def balance_brackets(exp)
  stack = []
  pair = { "}": "{", "]": "[", ")": "(" }
  exp.each_char do |c|
    stack.push(c) if '{[('.include?(c)
    if '}])'.include?(c)
      return  0 if pair[c.to_sym] != stack.pop
    end
  end
  return 1
end
def balance_brackets(exp)
  stack = []
  pair = { "}": "{", "]": "[", ")": "(" }
  exp.each_char do |c|
    stack.push(c) if c == "{" || c == "[" || c == "("
    if c == "}" || c == "]" || c == ")"
      return  0 if pair[c.to_sym] != stack.pop
    end
  end
  return 1
end
# set benchmark here 
####################################################################
# that, given an array A consisting of N integers, returns index of any element of array A in 
# which the dominator of A occurs. The function should return −1 if array A does not have a dominator.

# For example, given array A such that

#  A[0] = 3    A[1] = 4    A[2] =  3
#  A[3] = 2    A[4] = 3    A[5] = -1
#  A[6] = 3    A[7] = 3
# the function may return 0, 2, 4, 6 or 7, as explained above.

a = [3, 4, 3, 2, 3, -1, 3, 3]
d = {}
a.each_with_index { |n,i|  d.has_key?(n) ? d[n].push(i) : d[n] = [i] }
d.values.max {|a, b| a.size <=> b.size }
d.max_by { |x| x.length } # wrong
####################################################################
####################################################################
# def my_method
#   puts "reached the top"
#   yield
#   puts "reached the bottom"
# end

# my_method do
#   puts "reached yield"
# end
# reached the top
# reached yield
# reached the bottom
# # -====================
# def my_method
#   yield("John", 2)
#   puts "Hi #{name}"
# end

# my_method { |name, age| puts "#{name} is #{age} years old" }

# # output
# John is 2 years old
# NameError: undefined local variable or method `name' for #<IRB::...> but you can store last evaluated expression from block
#===========================
# What does &block (ampersand parameter) mean?
# Here’s what &object does:

# if the object is a block, it converts it to a Proc.
# if the object is a Proc, it converts it to a block.
# if the object is something else, it calls to_proc on it, and then converts it to a block.
#####https://mixandgo.com/l earn/ruby-blocks
[2,3,4,5,6].select(&:even?)
#.select { |e| e.even? }
####################################################################
