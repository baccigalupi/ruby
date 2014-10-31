def getstage
  age = rand(111)
  ch = rand(3) # randomly pick one of the three strategies in this method
  #puts "Age is #{age}"
  t = ""
  if ch == 0
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
  elsif ch == 1
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
      t='record breaking'
    end
  else
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
        t='record breaking'
    end
  end
  puts "#{age} years old, thus the person is a #{t}"
end

def arrayage
  age = rand(111)
  agearr = [1,10,12,19,40,65,100,110]
  txtarr = ["baby","child","tween","teen","adult","middle age","senior","record breaking"]
  agearr.each_with_index do |a,idx|
    if age < a
      txt = txtarr[idx]
      puts "#{age} years old, thus the person is a #{txt}"
      break
    end
  end
end

if rand(3) == 0 # 1/3 chance of picking the one using arrays, otherwise do ifelse
  arrayage
else
  getstage
end
