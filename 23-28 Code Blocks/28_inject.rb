# This file is a transcript of the IRB session shown in the movie.
# You should be able to cut and paste it into IRB to get 
# the same results shown in the comments.

# irb --simple-prompt
array = [*1..10]
# => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
sum = array.inject {|memo, n| memo + n }
# => 55
sum = array.inject(100) {|memo, n| memo + n }
# => 155
product = array.inject {|memo, n| memo * n }
# => 3628800
product = array.inject(2) {|memo, n| memo * n }
# => 7257600
sum = array.inject {|memo, n| memo + n if n != 3 }
# NoMethodError: undefined method `+' for nil:NilClass
# 	from (irb):6
# 	from (irb):6:in `inject'
# 	from (irb):6:in `each'
# 	from (irb):6:in `inject'
# 	from (irb):6
# 	from :0
sum = array.inject {|memo, n| puts memo + n }
# 3
# NoMethodError: undefined method `+' for nil:NilClass
# 	from (irb):7
# 	from (irb):7:in `inject'
# 	from (irb):7:in `each'
# 	from (irb):7:in `inject'
# 	from (irb):7
# 	from :0
sum = array.inject {|memo, n| puts memo + n; memo }
# 3
# 4
# 5
# 6
# 7
# 8
# 9
# 10
# 11
# => 1
fruits = ['apple', 'pear', 'banana', 'plum']
# => ["apple", "pear", "banana", "plum"]
longest_word = fruits.inject do |memo, fruit|
  if memo.length > fruit.length
    memo
  else
    fruit
  end
end
# => "banana"
menu = ["Home", "History", "Products", "Services", "Contact Us"]
# => ["Home", "History", "Products", "Services", "Contact Us"]
menu.inject(10) {|memo, item| memo + item.length }
# => 47
quit
