# This file is a transcript of the IRB session shown in the movie.
# You should be able to cut and paste it into IRB to get 
# the same results shown in the comments.

# irb
x = 1
# => 1
x == 1
# => true
true.class
# => TrueClass
false.class
# => FalseClass
x != 1
# => false
x < 3
# => true
x > 3
# => false
!x
# => false
!y
# NameError: undefined local variable or method `y' for main:Object
# 	from (irb):9
# 	from :0
y = false
# => false
!y
# => true
1 <= 4 && 5 <= 100
# => true
1 <= 4 && 5 <= 100 && 100 >= 200
# => false
1 <= 4 || 5 <= 100 || 100 >= 200
# => true
16 <= 4 || 5 <= 100 || 100 >= 200
# => true
16 <= 4 || 500 <= 100 || 100 >= 200
# => false
x.nil?
# => false
y.nil?
# => false
z.nil?
# NameError: undefined local variable or method `z' for main:Object
# 	from (irb):19
# 	from :0
z = nil
# => nil
z.nil?
# => true
2.between?(1,4)
# => true
2.between?(3,4)
# => false
[1,2,3].empty?
# => false
[].empty?
# => true
[1,2,3].include?(2)
# => true
[1,2,3].include?(5)
# => false
{'a' => 1, 'b' => 2}.has_key?('a')
# => true
{'a' => 1, 'b' => 2}.has_key?(:a)
# => false
{'a' => 1, 'b' => 2}.has_value?(2)
# => true
quit
