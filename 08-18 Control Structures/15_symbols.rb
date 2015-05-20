# This file is a transcript of the IRB session shown in the movie.
# You should be able to cut and paste it into IRB to get 
# the same results shown in the comments.

# irb
:test
# => :test
:this_test
# => :this_test
"test".object_id
# => 26340
:test.object_id
# => 80818
"test".object_id
# => 285760
:test.object_id
# => 80818
hash = {:first_name => 'Amir', :last_name => 'Azimi'}
# => {:first_name=>"Amir", :last_name=>"Azimi"}
hash['first_name']
# => nil
hash[:first_name]
# => "Amir"
:test = 1
# SyntaxError: compile error
# (irb):10: syntax error, unexpected '=', expecting $end
# :test = 1
#        ^
# 	from (irb):10
# 	from :0
quit
