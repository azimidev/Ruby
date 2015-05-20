# This file is a transcript of the IRB session shown in the movie.
# You should be able to cut and paste it into IRB to get 
# the same results shown in the comments.

# irb
1..10
# => 1..10
x = 1..10
# => 1..10
x.class
# => Range
1..10.class
# ArgumentError: bad value for range
# 	from (irb):4
# 	from :0
(1..10).class
# => Range
x.begin
# => 1
x.end
# => 10
x.first
# => 1
x.last
# => 10
y = 1...10
# => 1...10
y.begin
# => 1
y.end
# => 10
x.include?(1)
# => true
x.include?(10)
# => true
y.include?(10)
# => false
z = [*x]
# => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
x
# => 1..10
z
# => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
'a'..'m'
# => "a".."m"
alpha = 'a'..'m'
# => "a".."m"
alpha.include?('g')
# => true
[*alpha]
# => ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m"]
quit
