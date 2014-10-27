age = rand(111)
puts "Age is #{age}"
t = ""
if age<1
  t="baby"
elsif age<10&&age>1
  t="child"
elsif age<12&&age>10
  t="tween"
elsif age<19&&age>12
  t="teenager"
elsif age<40&&age>20
  t="adult"
elsif age>40&&age<65
  t="middle age"
elsif age>66&&age<100
  t="senior"
elsif age>100
  t="record breaking"
else
  t="due to an oversight in math, this age (#{age}) is an \"in between\" year"
end
puts t
