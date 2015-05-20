# This file is a transcript of the IRB session shown in the movie.
# You should be able to cut and paste it into IRB to get 
# the same results shown in the comments.

# irb --simple-prompt
array = [1,2,3,4,5]
# => [1, 2, 3, 4, 5]
array.each {|num| puts num * 20 }
# 20
# 40
# 60
# 80
# 100
# => [1, 2, 3, 4, 5]
x = 1
# => 1
puts num
# NameError: undefined local variable or method `num' for main:Object
# 	from (irb):4
# 	from :0
array.each {|num| puts num * 20 + x }
# 21
# 41
# 61
# 81
# 101
# => [1, 2, 3, 4, 5]
puts num
# NameError: undefined local variable or method `num' for main:Object
# 	from (irb):6
# 	from :0
num = 1
# => 1
array.each {|num| puts num * 20 + x }
# 21
# 41
# 61
# 81
# 101
# => [1, 2, 3, 4, 5]
puts num
# 5
# => nil
item_count = 0
# => 0
quit
