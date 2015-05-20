# This file is a transcript of the IRB session shown in the movie.
# You should be able to cut and paste it into IRB to get 
# the same results shown in the comments.

# irb
data_set = []
# => []
data_set = ["a", "b", "c"]
# => ["a", "b", "c"]
data_set[1]
# => "b"
data_set[0]
# => "a"
data_set[2]
# => "c"
data_set[3]
# => nil
data_set[0] = "d"
# => "d"
data_set
# => ["d", "b", "c"]
data_set << "e"
# => ["d", "b", "c", "e"]
data_set[1] = nil
# => nil
data_set
# => ["d", nil, "c", "e"]
data_set.clear
# => []
data_set
# => []
data_set = []
# => []
data_set = nil
# => nil
data_set = []
# => []
data_set.class
# => Array
data_set = nil
# => nil
data_set.class
# => NilClass
quit