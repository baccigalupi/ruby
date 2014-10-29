@die = []
@bets = []
@bsc=[0,0,0] # triple, big, small
# @combos = {
#   triples => [1,2,3,4,5,6,'a'],
#   doubles => [1,2,3,4,5,6,'a'],
#   combos => ["111", "112", "113", "114", "115", "116", "121", "122", "123", "124", "125", "126", "131", "132", "133", "134", "135", "136", "141", "142", "143", "144", "145", "146", "151", "152", "153", "154", "155", "156", "161", "162", "163", "164", "165", "166", "211", "212", "213", "214", "215", "216", "221", "222", "223", "224", "225", "226", "231", "232", "233", "234", "235", "236", "241", "242", "243", "244", "245", "246", "251", "252", "253", "254", "255", "256", "261", "262", "263", "264", "265", "266", "311", "312", "313", "314", "315", "316", "321", "322", "323", "324", "325", "326", "331", "332", "333", "334", "335", "336", "341", "342", "343", "344", "345", "346", "351", "352", "353", "354", "355", "356", "361", "362", "363", "364", "365", "366", "411", "412", "413", "414", "415", "416", "421", "422", "423", "424", "425", "426", "431", "432", "433", "434", "435", "436", "441", "442", "443", "444", "445", "446", "451", "452", "453", "454", "455", "456", "461", "462", "463", "464", "465", "466", "511", "512", "513", "514", "515", "516", "521", "522", "523", "524", "525", "526", "531", "532", "533", "534", "535", "536", "541", "542", "543", "544", "545", "546", "551", "552", "553", "554", "555", "556", "561", "562", "563", "564", "565", "566", "611", "612", "613", "614", "615", "616", "621", "622", "623", "624", "625", "626", "631", "632", "633", "634", "635", "636", "641", "642", "643", "644", "645", "646", "651", "652", "653", "654", "655", "656", "661", "662", "663", "664", "665", "666"]
#    arraycombo => [[1, 1, 1], [1, 1, 2], [1, 1, 3], [1, 1, 4], [1, 1, 5], [1, 1, 6], [1, 2, 1], [1, 2, 2], [1, 2, 3], [1, 2, 4], [1, 2, 5], [1, 2, 6], [1, 3, 1], [1, 3, 2], [1, 3, 3], [1, 3, 4], [1, 3, 5], [1, 3, 6], [1, 4, 1], [1, 4, 2], [1, 4, 3], [1, 4, 4], [1, 4, 5], [1, 4, 6], [1, 5, 1], [1, 5, 2], [1, 5, 3], [1, 5, 4], [1, 5, 5], [1, 5, 6], [1, 6, 1], [1, 6, 2], [1, 6, 3], [1, 6, 4], [1, 6, 5], [1, 6, 6], [2, 1, 1], [2, 1, 2], [2, 1, 3], [2, 1, 4], [2, 1, 5], [2, 1, 6], [2, 2, 1], [2, 2, 2], [2, 2, 3], [2, 2, 4], [2, 2, 5], [2, 2, 6], [2, 3, 1], [2, 3, 2], [2, 3, 3], [2, 3, 4], [2, 3, 5], [2, 3, 6], [2, 4, 1], [2, 4, 2], [2, 4, 3], [2, 4, 4], [2, 4, 5], [2, 4, 6], [2, 5, 1], [2, 5, 2], [2, 5, 3], [2, 5, 4], [2, 5, 5], [2, 5, 6], [2, 6, 1], [2, 6, 2], [2, 6, 3], [2, 6, 4], [2, 6, 5], [2, 6, 6], [3, 1, 1], [3, 1, 2], [3, 1, 3], [3, 1, 4], [3, 1, 5], [3, 1, 6], [3, 2, 1], [3, 2, 2], [3, 2, 3], [3, 2, 4], [3, 2, 5], [3, 2, 6], [3, 3, 1], [3, 3, 2], [3, 3, 3], [3, 3, 4], [3, 3, 5], [3, 3, 6], [3, 4, 1], [3, 4, 2], [3, 4, 3], [3, 4, 4], [3, 4, 5], [3, 4, 6], [3, 5, 1], [3, 5, 2], [3, 5, 3], [3, 5, 4], [3, 5, 5], [3, 5, 6], [3, 6, 1], [3, 6, 2], [3, 6, 3], [3, 6, 4], [3, 6, 5], [3, 6, 6], [4, 1, 1], [4, 1, 2], [4, 1, 3], [4, 1, 4], [4, 1, 5], [4, 1, 6], [4, 2, 1], [4, 2, 2], [4, 2, 3], [4, 2, 4], [4, 2, 5], [4, 2, 6], [4, 3, 1], [4, 3, 2], [4, 3, 3], [4, 3, 4], [4, 3, 5], [4, 3, 6], [4, 4, 1], [4, 4, 2], [4, 4, 3], [4, 4, 4], [4, 4, 5], [4, 4, 6], [4, 5, 1], [4, 5, 2], [4, 5, 3], [4, 5, 4], [4, 5, 5], [4, 5, 6], [4, 6, 1], [4, 6, 2], [4, 6, 3], [4, 6, 4], [4, 6, 5], [4, 6, 6], [5, 1, 1], [5, 1, 2], [5, 1, 3], [5, 1, 4], [5, 1, 5], [5, 1, 6], [5, 2, 1], [5, 2, 2], [5, 2, 3], [5, 2, 4], [5, 2, 5], [5, 2, 6], [5, 3, 1], [5, 3, 2], [5, 3, 3], [5, 3, 4], [5, 3, 5], [5, 3, 6], [5, 4, 1], [5, 4, 2], [5, 4, 3], [5, 4, 4], [5, 4, 5], [5, 4, 6], [5, 5, 1], [5, 5, 2], [5, 5, 3], [5, 5, 4], [5, 5, 5], [5, 5, 6], [5, 6, 1], [5, 6, 2], [5, 6, 3], [5, 6, 4], [5, 6, 5], [5, 6, 6], [6, 1, 1], [6, 1, 2], [6, 1, 3], [6, 1, 4], [6, 1, 5], [6, 1, 6], [6, 2, 1], [6, 2, 2], [6, 2, 3], [6, 2, 4], [6, 2, 5], [6, 2, 6], [6, 3, 1], [6, 3, 2], [6, 3, 3], [6, 3, 4], [6, 3, 5], [6, 3, 6], [6, 4, 1], [6, 4, 2], [6, 4, 3], [6, 4, 4], [6, 4, 5], [6, 4, 6], [6, 5, 1], [6, 5, 2], [6, 5, 3], [6, 5, 4], [6, 5, 5], [6, 5, 6], [6, 6, 1], [6, 6, 2], [6, 6, 3], [6, 6, 4], [6, 6, 5], [6, 6, 6]]
# }
rolled_dice = []
def instructions
  puts "Welcome to Sicbo!".center(90)
  puts "The three dice have been rolled, you can bet now on any of the following outcomes".center(90)
  puts ""
  puts "Triple Outcomes (180:1)".ljust(30) + "Double Outcomes (11:1)".ljust(30) + "Any Dice (single 1:1, double 2:1, triple 3:1)".ljust(30)
  puts "t1. [1, 1, 1]".ljust(30) + "d1. [1, 1, *]".ljust(30) + "s1. [1, *, *]".ljust(30)
  puts "t2. [2, 2, 2]".ljust(30) + "d2. [2, 2, *]".ljust(30) + "s2. [2, *, *]".ljust(30)
  puts "t3. [3, 3, 3]".ljust(30) + "d3. [3, 3, *]".ljust(30) + "s3. [3, *, *]".ljust(30)
  puts "t4. [4, 4, 4]".ljust(30) + "d4. [4, 4, *]".ljust(30) + "s4. [4, *, *]".ljust(30)
  puts "t5. [5, 5, 5]".ljust(30) + "d5. [5, 5, *]".ljust(30) + "s5. [5, *, *]".ljust(30)
  puts "t6. [6, 6, 6]".ljust(30) + "d6. [6, 6, *]".ljust(30) + "s6. [6, *, *]".ljust(30)
  puts ""
  puts "Any Two Dice (6:1)".center(90)
  puts "a1. [1, 2, *]".ljust(30) + "a6. [2, 3, *]".ljust(30) + "a11. [3, 5, *]".ljust(30)
  puts "a2. [1, 3, *]".ljust(30) + "a7. [2, 4, *]".ljust(30) + "a12. [3, 6, *]".ljust(30)
  puts "a3. [1, 4, *]".ljust(30) + "a8. [2, 5, *]".ljust(30) + "a13. [4, 5, *]".ljust(30)
  puts "a4. [1, 5, *]".ljust(30) + "a9. [2, 6, *]".ljust(30) + "a14. [4, 6, *]".ljust(30)
  puts "a5. [1, 6, *]".ljust(30) + "a10. [3, 4, *]".ljust(30) + "a15. [5, 6, *]".ljust(30)
  puts ""
  puts "Specific Sum".center(60) + "Other Options".ljust(30)
  puts "e4. 4 (60:1)".ljust(30) + "e17. 17 (60:1)".ljust(30) + "small (sum <= 10, excludes triples, 1:1)".ljust(30)
  puts "e5. 5 (30:1)".ljust(30) + "e16. 16 (30:1)".ljust(30) + "big (sum >= 11, excludes triples, 1:1)".ljust(30)
  puts "e6. 6 (17:1)".ljust(30) + "e15. 15 (17:1)".ljust(30) + "triple (any triple, 25:1)".ljust(30)
  puts "e7. 7 (12:1)".ljust(30) + "e14. 14 (12:1)".ljust(30) + "[#, #, #] (any specific combination with double 50:1)"
  puts "e8. 8 (8:1)".ljust(30) + "e13. 13 (8:1)".ljust(30) + "[#, #, #] (any specific combination without double 30:1)"
  puts "e9. 9 (6:1)".ljust(30) + "e12. 12 (6:1)".ljust(30)
  puts "e10. 10 (6:1)".ljust(30) + "e11. 11 (6:1)".ljust(30)
  puts ""
  puts "Enter any of these to bet using option bet, multiple bets seperated by semicolon (;)"
  puts "\"t1 5; a4 30; [2, 3, 5] 10; big 50\" bets $5 on [1, 1, 1], $30 on [1, 4, *], $10 on [2, 3, 5], $50 on big"
  puts ""
  puts "Please enter your bets now"
end
def parse_bets
  parsedBets = []
  betarr = @bets.split(';')
  betarr.each do |bet|
    bet = bet.strip
    args = ""
    parts = bet.split(' ')
    if /[0-9]/.match(parts[0])
      amount = parts[0]
      args = parts[1]
    elsif /[0-9]/.match(parts[1])
      amount = parts[1]
      args = parts[0]
    else
      error = "#{bet} did not have a bet amount and was skipped"
      amount = error
    end
    if amount.to_i > 0
      this_bet = { "amount" => amount, "args" => args }
      if args.
    end
    print this_bet
  end
  print parsedBets
end
def start_game
  instructions
  bet = gets.chomp
  @bets = bet
  parse_bets
end
def restart_game
  rolled_dice = [roll, roll, roll]
end
def game
  die=[roll,roll,roll]
  die.sort!
  if die.same_values?
    type = "triple"
    bs = ""
    @bsc[0] += 1
  else
    sum = die.inject(:+)
    if sum <= 10
      bs = "small"
      @bsc[2] += 1
    else
      bs = "big"
      @bsc[1] += 1
    end
    double = 0; # the value of the double dice
    ds = 0 # the single value if there is a double
    if die[0] == die[1]
      double = die[0]
      ds = die[2]
    elsif die[1] == die[2]
      double = die[1]
      ds = die[0]
    elsif die[2] == die[0]
      double = die[2]
      ds = die[1]
    end
    double>0?type="double":type="none" # if the value of double is >0, it is of type double
  end
  tt = type=="triple"? "  Triple #{die[1]}" : "  Sum: #{sum}"
  dt = type=="double"? "  Double #{double}" : ""
  bs = "Big #{bs=="big"?"✓":"✗"}  |  #{bs=="small"?"✓":"✗"} Small"
  puts "#{bs} #{tt} #{dt}"

end
def roll
  rand(6)+1
end
def com
  opts = []
  (1..6).each do |n|
    e = [n]
    (1..6).each do |o|
      f = e.dup.push(o)
      (1..6).each do |q|
        g = f.dup.push(q)
        opts.push(g)
      end
    end
  end
  print opts
end
# com
# Check for triple
class Array
  def same_values?
    self.uniq.length == 1
  end
end

#execute
start_game
#execute
@its = 1;
(0..@its).each do |i|
  #game
end
#puts "Triples: #{@bsc[0]}"
#puts "Doubles: #{@bsc[1]}"
#puts "Neither: #{@bsc[2]}"
