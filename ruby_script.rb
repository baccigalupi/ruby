#require 'fileutils'
#load 'test.rb'
#printNum(5,8)
#arr = ["string",4,"string1","string2",5,6,printNum]
#arr.each do |item|
#  puts "#{item}: #{item.class}"
#end
child = 1
#puts child.class.superclass
child = child.class.superclass
while child.superclass != nil
  puts child.superclass
  child = child.superclass
end
