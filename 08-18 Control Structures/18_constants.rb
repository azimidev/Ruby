# This file is a transcript of the IRB session shown in the movie.
# You should be able to cut and paste it into IRB to get 
# the same results shown in the comments.

# irb
test = 1
# => 1
TEST = 2
# => 2
test
# => 1
TEST
# => 2
Hello = 10
# => 10
test = 100
# => 100
TEST = 100
# (irb):7: warning: already initialized constant TEST
# => 100
TEST
# => 100
Hello = 20
# (irb):9: warning: already initialized constant Hello
# => 20
quit
