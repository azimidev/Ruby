
def welcome(name="World")
	return "Hello #{name}!"
end

def add_and_subtract(n1=0, n2=0)
	add = n1 + n2
	sub = n1 - n2
	return [add, sub]
end

def longest_word(words=[])
  longest_word = words.inject do |memo,word|
    memo.length > word.length ? memo : word
  end
  return longest_word
end

# Return doesn't have to be at the end 
# and there can be more than one.
# Useful for conditional statements.
def over_five?(value=nil)
	return "Exactly 5" if value.to_i == 5
	if value.to_i > 5
		return "Over 5"
	else
		return "Under 5"
	end
end

welcome("Mary")
returned_value = welcome("John")
puts returned_value

result = add_and_subtract(2,2)
puts result[0]
puts result[1]
add, sub = add_and_subtract(5,5)

fruits = ['apple', 'pear', 'banana', 'plum']
puts longest_word(fruits).length

puts over_five?(112 / 18)
