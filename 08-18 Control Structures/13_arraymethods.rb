# This file is a transcript of the IRB session shown in the movie.
# You should be able to cut and paste it into IRB to get 
# the same results shown in the comments.

# irb
array = [1,2,3,4,5]
# => [1, 2, 3, 4, 5]
array2 = [1, "2", 3.0, ["a", "b"], "dog"]
# => [1, "2", 3.0, ["a", "b"], "dog"]
array.inspect
# => "[1, 2, 3, 4, 5]"
array
# => [1, 2, 3, 4, 5]
puts array
# 1
# 2
# 3
# 4
# 5
# => nil
puts array.inspect
# [1, 2, 3, 4, 5]
# => nil
puts array2.inspect
# [1, "2", 3.0, ["a", "b"], "dog"]
# => nil
puts array2
# 1
# 2
# 3.0
# a
# b
# dog
# => nil
array2.to_s
# => "123.0abdog"
array2.join
# => "123.0abdog"
array2.join(", ")
# => "1, 2, 3.0, a, b, dog"
x = "1,2,3,4,5"
# => "1,2,3,4,5"
y = x.split(',')
# => ["1", "2", "3", "4", "5"]
y
# => ["1", "2", "3", "4", "5"]
y.reverse
# => ["5", "4", "3", "2", "1"]
array
# => [1, 2, 3, 4, 5]
array << 0
# => [1, 2, 3, 4, 5, 0]
array.sort
# => [0, 1, 2, 3, 4, 5]
array2.sort
# ArgumentError: comparison of Float with String failed
# 	from (irb):19:in `sort'
# 	from (irb):19
# 	from :0
array << 3
# => [1, 2, 3, 4, 5, 0, 3]
array.uniq
# => [1, 2, 3, 4, 5, 0]
array
# => [1, 2, 3, 4, 5, 0, 3]
array.uniq!
# => [1, 2, 3, 4, 5, 0]
array
# => [1, 2, 3, 4, 5, 0]
array.delete_at(2)
# => 3
array
# => [1, 2, 4, 5, 0]
array.delete(4)
# => 4
array
# => [1, 2, 5, 0]
array << 3
# => [1, 2, 5, 0, 3]
array.push(4)
# => [1, 2, 5, 0, 3, 4]
array.pop
# => 4
array
# => [1, 2, 5, 0, 3]
array.shift
# => 1
array
# => [2, 5, 0, 3]
array.unshift(1)
# => [1, 2, 5, 0, 3]
array
# => [1, 2, 5, 0, 3]
array + [9, 10, 11, 12]
# => [1, 2, 5, 0, 3, 9, 10, 11, 12]
array
# => [1, 2, 5, 0, 3]
new_array = array + [9,10]
# => [1, 2, 5, 0, 3, 9, 10]
new_array = array - [9,10]
# => [1, 2, 5, 0, 3]
new_array = array - [2]
# => [1, 5, 0, 3]
quit
