#!/usr/bin/ruby

i = 0

loop do
  i = i+1
  if (i % 2) == 1
    puts "Yhis is the number #{i}"
    next
  end

  puts i
  break if i > 10
end

#example of block
#block is similar to methods
#we don't separate method, just want logic
arr = [1,2,3,4,5]

arr.each {|element| puts element}
#arr.each do |element| puts element end

#same as this ⬇
def puts_element(element)
  puts element
end

for i in arr
  puts_element i
end

#same as this ⬇
def puts_element(element)
  yield element
end

for i in arr
  puts_element(i) {|j| puts j}
end

#iterating over range
(1..6).each do |element|
  puts element
end

1.upto(5) do |element|
  puts element
end

5.sownto(1) do |element|
  puts element
end

5.times do |i|
  puts "hello #{i+1}"
end
