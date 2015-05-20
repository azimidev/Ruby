# This file is a transcript of the IRB session shown in the movie.
# You should be able to cut and paste it into IRB to get 
# the same results shown in the comments.

# irb
person = ['Amir', "Azimi", 'male', 'brown', 'brown']
# => ['Amir', "Azimi", 'male', 'brown', 'brown']
person = { 'first_name' => 'Amir', 'last_name' => 'Azimi' } 
# => {"first_name"=>"Amir", "last_name"=>"Azimi"}
person['first_name']
# => "Amir"
person['last_name']
# => "Azimi"
person.index('Amir')
# => "first_name"
mixed = {1 => ['a', 'b', 'c'], 'hello' => 'world', [10,20] => 'top'}
# => {[10, 20]=>"top", 1=>["a", "b", "c"], "hello"=>"world"}
mixed
# => {[10, 20]=>"top", 1=>["a", "b", "c"], "hello"=>"world"}
mixed[1]
# => ["a", "b", "c"]
mixed[[10,20]]
# => "top"
mixed.keys
# => [[10, 20], 1, "hello"]
mixed.values
# => ["top", ["a", "b", "c"], "world"]
mixed.length
# => 3
mixed.size
# => 3
mixed.to_a
# => [[[10, 20], "top"], [1, ["a", "b", "c"]], ["hello", "world"]]
mixed.clear
# => {}
mixed = {}
# => {}
person
# => {"first_name"=>"Amir", "last_name"=>"Azimi"}
person['gender'] = 'male'
# => "male"
person
# => {"gender"=>"male", "first_name"=>"Amir", "last_name"=>"Azimi"}
quit
