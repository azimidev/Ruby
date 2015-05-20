# This file is a transcript of the IRB session shown in the movie.
# You should be able to cut and paste it into IRB to get 
# the same results shown in the comments.

# irb --simple-prompt
1.upto(5) do |num|
  puts "Hello " + num.to_s
end
# Hello 1
# Hello 2
# Hello 3
# Hello 4
# Hello 5
# => 1
fruits = ['banana', 'apple', 'pear']
# => ["banana", "apple", "pear"]
fruits.each do |fruit|
  puts fruit.capitalize
end
# Banana
# Apple
# Pear
# => ["banana", "apple", "pear"]
for fruit in fruits
  puts fruit.capitalize
end
# Banana
# Apple
# Pear
# => ["banana", "apple", "pear"]
quit
