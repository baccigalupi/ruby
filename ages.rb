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
#puts t
t = 'OLD'
if age<1
  t='baby'
elsif age<10
  t='child'
elsif age<12
  t='tween'
elsif age<19
  t='teen'
elsif age<40
  t='adult'
elsif age<65
  t='middle age'
elsif age<100
  t='senior'
elsif age<110
  t='super old'
end
#puts t
t='NOT HEAR'
a = age
case a
when (0..1)
  t='baby'
when (1..9)
  t='child'
when (9..12)
  t='tween'
when (12..19)
  t='teen'
when (20..40)
  t='adult'
when (40..65)
  t='middle age'
when (65..100)
  t='senior'
when (100..110)
  t='supa dupa old'
end

puts t
