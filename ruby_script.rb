@single = 0
@double = 0
@triple = 0
def sicbo
  die1 = roll
  die2 = roll
  die3 = roll
  die = "#{die1} #{die2} #{die3}"
  msg = ""
  if die1 == die2 && die2 == die3
    #msg = "Triple #{die1}, that's unlikely"
    @triple = @triple + 1
  elsif die1 == die2 || die2 == die3 || die1 == die3
    #msg = "#{die1}, #{die2}, #{die3}, double is kind good"
    @double = @double + 1
  elsif
    #msg = "#{die1}#{die2}#{die3}"
    @single = @single + 1
  end
  #puts msg+"\n"
end
def roll
  rand(6)+1
end
@games = 1000000
puts "Playing #{@games} games, be patient"
(1..@games).each do |i|
  sicbo
end
puts "#{@triple} Triples\n"
puts "#{@double} Doubles\n"
puts "#{@single} Singles\n"
