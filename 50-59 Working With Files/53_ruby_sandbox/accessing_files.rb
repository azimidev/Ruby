# Two ways to open files for reading/writing

# 1. Instantiate a file object, give it instructions
file = File.new('file1.txt', 'w')
file.puts "Ruby"
file.print "programming"
file.write "is"
file << "fun"
file.close

# 2. Provide a file with a block of instructions
File.open('file1.txt', 'r') do |file|
  # read data from the file
end

# second argument is the 'mode': r, w, a, r+, w+, a+