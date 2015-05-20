# This file is a transcript of the IRB session shown in the movie.
# You should be able to cut and paste it into IRB to get 
# the same results shown in the comments.

# irb --simple-prompt
1 <=> 2
# => -1
2 <=> 1
# => 1
2 <=> 2
# => 0
array = [3,1,5,2,4]
# => [3, 1, 5, 2, 4]
array
# => [3, 1, 5, 2, 4]
array.sort {|v1,v2| v1 <=> v2 }
# => [1, 2, 3, 4, 5]
array.sort
# => [1, 2, 3, 4, 5]
array.sort {|v1,v2| v2 <=> v1 }
# => [5, 4, 3, 2, 1]
array.sort.reverse
# => [5, 4, 3, 2, 1]
fruits = ['banana', 'apple', 'orange', 'pear']
# => ["banana", "apple", "orange", "pear"]
fruits.sort
# => ["apple", "banana", "orange", "pear"]
fruits.sort {|fruit1,fruit2| fruit1.length <=> fruit2.length}
# => ["pear", "apple", "orange", "banana"]
fruits.sort {|fruit1,fruit2| fruit2.length <=> fruit1.length}
# => ["banana", "orange", "apple", "pear"]
fruits.sort_by {|fruit| fruit.length}
# => ["pear", "apple", "orange", "banana"]
fruits.sort_by {|fruit| fruit.reverse }
# => ["banana", "orange", "apple", "pear"]
fruits
# => ["banana", "apple", "orange", "pear"]
fruits.sort! {|fruit1,fruit2| fruit1.length <=> fruit2.length}
# => ["pear", "apple", "orange", "banana"]
fruits
# => ["pear", "apple", "orange", "banana"]
hash = {"c" => 222, "a" => 555, "d" => 111, "b" => 333}
# => {"a"=>555, "b"=>333, "c"=>222, "d"=>111}
hash.to_a
# => [["a", 555], ["b", 333], ["c", 222], ["d", 111]]
hash
# => {"a"=>555, "b"=>333, "c"=>222, "d"=>111}
hash.sort {|item1,item2| item1[0] <=> item2[0] }
# => [["a", 555], ["b", 333], ["c", 222], ["d", 111]]
hash.sort {|item1,item2| item1[1] <=> item2[1] }
# => [["d", 111], ["c", 222], ["b", 333], ["a", 555]]
quit
