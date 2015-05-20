# This file is a transcript of the IRB session shown in the movie.
# You should be able to cut and paste it into IRB to get 
# the same results shown in the comments.

# irb --simple-prompt
h1 = { "a" => 111, "b" => 222 }
# => {"a"=>111, "b"=>222}
h2 = { "b" => 333, "c" => 444 }
# => {"b"=>333, "c"=>444}
h1.merge(h2)
# => {"a"=>111, "b"=>333, "c"=>444}
h2.merge(h1)
# => {"a"=>111, "b"=>222, "c"=>444}
h1.merge(h2) {|key,old,new| new  }
# => {"a"=>111, "b"=>333, "c"=>444}
h1.merge(h2) {|key,old,new| old }
# => {"a"=>111, "b"=>222, "c"=>444}
h1.merge(h2) {|key,old,new| old * 2 }
# => {"a"=>111, "b"=>444, "c"=>444}
h1.merge(h2) {|key,old,new| old * 5 }
# => {"a"=>111, "b"=>1110, "c"=>444}
h1.merge(h2) do |key, old, new|
  if old < new
    old
  else
    new
  end
end
# => {"a"=>111, "b"=>222, "c"=>444}
h1.merge(h2) {|k,o,n| o < n ? o : n }
# => {"a"=>111, "b"=>222, "c"=>444}
h1
# => {"a"=>111, "b"=>222}
h2
# => {"b"=>333, "c"=>444}
h1.merge!(h2)
# => {"a"=>111, "b"=>333, "c"=>444}
h1
# => {"a"=>111, "b"=>333, "c"=>444}
h2
# => {"b"=>333, "c"=>444}
quit
