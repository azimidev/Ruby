
def welcome(name="World")
	puts "Hello #{name}!"
end

def add(n1=0, n2=0)
	puts n1 + n2
end

def longest_word(words=[])
  longest_word = words.inject do |memo,word|
    memo.length > word.length ? memo : word
  end
  puts longest_word
end

def over_five?(value=nil)
	puts value.to_i > 5 ? 'Over 5' : 'Not over 5'
end

welcome("Mary")
welcome

add(2, 2)
add(3)

fruits = ['apple', 'pear', 'banana', 'plum']
longest_word(fruits)
longest_word

over_five?(112 / 18)
over_five?