a = "Hallo stringoperatoin"
b = 123
a_und_b = a + b.to_s
puts a_und_b


puts "--regular expression only characters and figures --"
id = "cf87640f-77fb-4208-8e5f-bb7ea1bf59b0]"
puts "id is ", id
newid = id.match(/(?<id>[a-zA-Z0-9-]+)/)
puts "New id", newid[:id ]

puts "-- 3.times loop"
3.times do
  puts "Hallo Welt"
end


puts "-- 15.upto(18)"
15.upto(18) do |a_number|
  puts "Durchlauf Nr. #{a_number}"
end


puts "--string symbol test"
puts "--string--"
string = "hallo "
symbol = :welt

puts string + symbol.to_s
puts string.length
puts string.upcase
puts string.reverse
puts string.count("l")

puts "--array operations"
puts "--array--"
a = [1,2,4,6]
puts a[3]
a[1] = a[1]*2
puts a[1]
puts "--complete array"
a << "Test"
a.push("Test2")
puts a.length
puts a.reverse

puts "--hash operations"
puts "--hash--"
h1 = { :one => "eins", two: "zwei" }
h2 = { "three" => "drei", 4 => "vier" }
puts h1[:two]
h2[five: "fuenf"]
h2.store(:six, "sechs")

puts h1.keys
puts h2.values
