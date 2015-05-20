def welcome
	puts "Hello World!"
end

def add
	puts 1 + 1
end

# Underscore between words, like variable names
def longest_word
  words = ['apple', 'pear', 'banana', 'plum']
  longest_word = words.inject do |memo,word|
    memo.length > word.length ? memo : word
  end
  puts longest_word
end

# Method names can have question marks in them
# Useful for tests and booleans
def over_five?
	value = 3
	puts value > 5 ? 'Over 5' : 'Not over 5'
end

# must define methods before calling them!
welcome
add
longest_word
over_five?