# Methods with arguments typically use parentheses.
# Methods without arguments typically do not.
# Parentheses are optional in both cases.

def welcome(name)
	puts "Hello #{name}!"
end

def add (n1,n2)
	puts n1 + n2
end

def longest_word(words)
  longest_word = words.inject do |memo,word|
    memo.length > word.length ? memo : word
  end
  puts longest_word
end

def over_five?(value)
	puts value > 5 ? 'Over 5' : 'Not over 5'
end

welcome "Marry"

add(2,3)
add(5,7)

fruits = ['apple', 'pear', 'banana', 'plum']
longest_word(fruits)

over_five?(20/2)



