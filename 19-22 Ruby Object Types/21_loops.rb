# This file is a transcript of the IRB session shown in the movie.
# You should be able to cut and paste it into IRB to get 
# the same results shown in the comments.

# irb --simple-prompt
x = 0
# => 0
loop do
  x += 2
  break if x >= 20
  puts x
end
# 2
# 4
# 6
# 8
# 10
# 12
# 14
# 16
# 18
# => nil
x = 0
# => 0
loop do
  x += 2
  break if x >= 20
  next if x == 6
  puts x
end
# 2
# 4
# 8
# 10
# 12
# 14
# 16
# 18
# => nil
x = 0
# => 0
while x < 20
  x += 2
  puts x
end
# 2
# 4
# 6
# 8
# 10
# 12
# 14
# 16
# 18
# 20
# => nil
quit
