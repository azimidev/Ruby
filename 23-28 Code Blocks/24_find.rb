# This file is a transcript of the IRB session shown in the movie.
# You should be able to cut and paste it into IRB to get 
# the same results shown in the comments.

# irb --simple-prompt
(1..10).find {|i| i == 5 }
# => 5
(1..10).find {|i| i % 3 == 0 }
# => 3
(1..10).detect {|i| i % 3 == 0 }
# => 3
(1..10).detect {|i| (1..10).include?(i * 3) }
# => 1
(1..10).find {|i| i == 20 }
# => nil
(1..10).find_all {|i| i % 3 == 0 }
# => [3, 6, 9]
(1..10).find_all {|i| i % 30 == 0 }
# => []
(1..10).select {|i| (1..10).include?(i * 3) }
# => [1, 2, 3]
(1..10).any? {|i| i % 3 == 0 }
# => true
(1..10).all? {|i| i % 3 == 0 }
# => false
(1..10).delete_if {|i| i % 3 == 0 }
# NoMethodError: undefined method `delete_if' for 1..10:Range
# 	from (irb):11
# 	from :0
[*1..10].delete_if {|i| i % 3 == 0 }
# => [1, 2, 4, 5, 7, 8, 10]
quit

