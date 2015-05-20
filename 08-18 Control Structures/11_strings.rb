# This file is a transcript of the IRB session shown in the movie.
# You should be able to cut and paste it into IRB to get 
# the same results shown in the comments.

# irb
"Hello"
# => "Hello"
'Hello'
# => "Hello"
greeting = "Hello"
# => "Hello"
target = 'world'
# => "world"
greeting + ' ' + target
# => "Hello world"
"Gabba"*5
# => "GabbaGabbaGabbaGabbaGabba"
1 * 5
# => 5
'1' * 5
# => "11111"
'I\'m escaped.'
# => "I'm escaped."
"I said, \"I'm escaped.\""
# => "I said, \"I'm escaped.\""
"3\\I said, \"I'm escaped.\""
# => "3\\I said, \"I'm escaped.\""
puts "3\\I said, \"I'm escaped.\""
# 3\I said, "I'm escaped."
# => nil
puts "\ta\tb\nc\nd"
# 	a	b
# c
# d
# => nil
puts '\ta\tb\nc\nd'
# \ta\tb\nc\nd
# => nil
puts "I want to say #{greeting} #{target}."
# I want to say Hello world.
# => nil
puts 'I want to say #{greeting} #{target}.'
# I want to say #{greeting} #{target}.
# => nil
puts "1 + 1 = #{ 1 + 1}"
# 1 + 1 = 2
# => nil
"Hello".reverse
# => "olleH"
"Hello".capitalize
# => "Hello"
"Hello".downcase
# => "hello"
"Hello".upcase
# => "HELLO"
"Hello".length
# => 5
"Hello".reverse.upcase
# => "OLLEH"
"Hello".reverse.upcase.length
# => 5
quit
