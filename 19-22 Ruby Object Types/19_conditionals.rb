# This file is a transcript of the IRB session shown in the movie.
# You should be able to cut and paste it into IRB to get 
# the same results shown in the comments.

# irb
name = "Amir"
# => "Amir"
if name == "Bob"
  puts "Found Bob!"
else
  puts "Not Bob..."
end
# Not Bob...
# => nil
if name == "Amir"
  puts "Found Amir!"
else
  puts "Not Amir..."
end
# Found Amir!
# => nil
if name == "Bob"
  puts "Found him"
elsif name == "Mary"
  puts "Found her"
else
  puts "Not Bob or Mary"
end
# Not Bob or Mary
# => nil
puts "This is Amir" if name == "Amir"
# This is Amir
# => nil
puts "This is Amir" if name == "bob"
# => nil
quit
