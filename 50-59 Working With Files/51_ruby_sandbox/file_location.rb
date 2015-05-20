# Absolute paths

# Use forward slashes, even on Windows
puts "/Users/kevin/Desktop/ruby_sandbox"
# File.join ensures platform independence
puts File.join('', 'Users', 'kevin', 'Desktop', 'ruby_sandbox')


# Relative paths

# __FILE__ is THIS file
puts __FILE__

# expand_path will convert a relative path to an absolute path
# in this case, it returns the full path the file
puts File.expand_path(__FILE__)

# relative paths are easiest when you start with 
# this file's directory
puts File.dirname(__FILE__)

# .. "moves back" one directory
puts File.join(File.dirname(__FILE__), '..', "Exercise\ Files")