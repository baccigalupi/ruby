require 'yaml'

@die = []
@bets = []
@options = { "triples" => {"t1" => [[1,1,1],180], "t2" => [[2,2,2],180],"t3" => [[3,3,3],180], "t4" => [[4,4,4],180], "t5" => [[5,5,5], 180], "t6" => [[6,6,6], 180] }, "doubles" => { "d1" => [[1,1],11], "d2" => [[2,2],11], "d3" => [[3,3],11], "d4" => [[4,4],11], "d5" => [[5,5],11], "d6" => [[6,6],11] }, "singles" => {"s1" => [1], "s2" => [2], "s3" => [3], "s4" => [4], "s5" => [5], "s6" => [6] }, "any" => {"a1" => [1,2], "a2" => [1,3], "a3" => [1,4], "a4" => [1,5], "a5" => [1,6], "a6" => [2,3], "a7" => [2,4], "a8" => [2,5], "a9" => [2,6], "a10" => [3,4], "a11" => [3,5], "a12" => [3,6], "a13" => [4,5], "a14" => [4,6], "a15" => [5,6] }, "sums" => { "e4" => [4,60], "e5" => [5,30], "e6" => [6,17], "e7" => [7,12], "e8" => [8,8], "e9" => [9,6], "e10" => [10,6], "e11" => [11,6], "e12" => [12,6], "e13" => [13,8], "e14" => [14,12], "e15" => [15,17], "e16" => [16,30], "e17" => [17,60] }, "others" => { "small" => []} }
@odds = { "triples" => 180, "triple" => 25, "doubles" => 11, "double" => 6, "exactd" => 50, "exacts" => 30, "small" => 1, "big" => 1, "selectt" => 3, "selectd" => 2, "selects" => 1, "any" => 6 }
@rolled_dice = []
@money = File.read 'sicbo.txt'
if !@money
  @money = 1000
else
  @money = @money.to_i
end

def instructions
  @rolled_die = [roll, roll, roll].sort;
  puts ""
  puts "Welcome to Sicbo!".center(90)
  puts "The three dice have been rolled, you can bet now on any of the following outcomes with your $#{@money}".center(90)
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
  puts "e7. 7 (12:1)".ljust(30) + "e14. 14 (12:1)".ljust(30) + "double (any double, 5:1)".ljust(30)
  puts "e8. 8 (8:1)".ljust(30) + "e13. 13 (8:1)".ljust(30) + "[#, #, #] (any specific combination with double 50:1)"
  puts "e9. 9 (6:1)".ljust(30) + "e12. 12 (6:1)".ljust(30) + "[#, #, #] (any specific combination without double 30:1)"
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
  sum = @rolled_die.inject(:+)
  rd = @rolled_die
  money = @money
  odds = @odds
  results =[]
  allbets = []
  totalpay = 0
  trip = rd | [rd[1]]
  sum = sum.to_i
  betarr.each do |bet|
    bet = bet.strip
    bet_str = ""
    args = ""
    parts = bet.split(' ')
    if /^[0-9]*$/.match(parts[0])
      amount = parts[0].to_i
      args = parts[1]
    elsif /^[0-9]*$/.match(parts[1])
      amount = parts[1].to_i
      args = parts[0]
    else
      error = "#{bet} did not have a bet amount and was skipped"
      amount = error
    end
    amount = amount.to_i
    pay = 0
    if amount > 0
      skip = false
      this_bet = { "amount" => amount, "args" => args }
      if args == 'big'
        if sum >= 11 && trip.length >= 2
          pay = amount*odds["big"]
        end
        bet_str = "big"
      elsif args == 'small'
        if sum <= 10 && trip.length >= 2
          pay = amount*odds["small"]
        end
        bet_str = "small"
      elsif(args.include?('['))
        args.gsub!(/(\,)(\S)/, "\\1 \\2")
        args = YAML::load(args)
        this_bet['args'] = args
        if @rolled_die == args.sort
          if args[0] == args[1] || args[1] == args[2] # doubles pay 50:1, singles pay 30:1
            pay = amount*odds["exactd"]
          else
            pay = amount*odds["exacts"]
          end
        end
        bet_str = "#{args} (exact)"
      elsif args == 'triple'
        bet_str = "any triple"
        this_bet['payout'] = amount*odds["triple"]
      elsif args.include?("t")
        tnum = args.gsub('t','').to_i
        if rd == [tnum, tnum, tnum]
          pay = amount*odds["triples"]
        end
        bet_str = "triple #{tnum}s"
      elsif args == 'double'
        if rd[0] == rd[1] || rd[1] == rd[2]
          pay = amount*odds["double"]
        end
        bet_str = "any double"
      elsif args.include?('d')
        tnum = args.gsub('d','').to_i
        matching = rd | [tnum, tnum]
        if matching.length == 2
          pay = amount*odds["doubles"]
        end
        bet_str = "any double"
      elsif args.include?('s')
        tnum = args.gsub('s','').to_i
        matching = rd | tnum
        if matching.length == 1
          pay = amount*odds["selectt"]
        elsif mathing.length == 2
          pay = amount*odss["selectd"]
        elsif matching.length == 3
          pay = amount*odds["selects"]
        end
        bet_str = "double #{tnum}s"
      elsif args.include?('a')
        list = @options['any']
        if (list[args][0] == rd[0] && list[args][1] == rd[1]) || (list[args][1] == rd[1] && list[args][2] == rd[2])
          pay = amount*odds["any"]
        end
        bet_str = "#{list[args]}"
      elsif args.include?('e')
        list = @options['sums']
        if list[args][0] == sum
          pay = amount*list[args][1]
        end
        bet_str = "sum of #{list[args][0]}"
      else
        puts "your bet \"#{bet}\" is an invalid format"
        skip = true
      end
      if !pay
        pay = 0
      end
    end
    if skip == false
      res = ""
      if pay > 0
        res = "paid $#{pay}"
      else
        pay = amount*-1
        res = "lost $#{amount}"
      end
      puts pay
      result = "Your bet of $#{amount} on #{bet_str} #{res}".ljust(60) + "$#{pay}".ljust(10)
      this_bet['payout'] = pay
      money = money + pay
      results.push(result)
      this_bet
      allbets.push(this_bet)
    end
  end
  yaml_bet = money
  filename = 'sicbo.txt'
  File.open filename, 'w' do |f|
    f.write yaml_bet
  end
  trip = rd | [rd[1]]
  bs = sum
  if trip.length >= 2
    if sum >= 11
      bs = "#{sum}/big"
    else
      bs = "#{sum}/small"
    end
  end
  puts ""
  puts "The three dice were #{rd.join(', ')} (#{bs})"
  puts results.join("\n")
  puts "Total".ljust(60) + "$#{money-@money}".ljust(10)
  puts "You now have $#{money} to use in future games"
  puts ""
end

def start_game
  instructions
  bet = gets.chomp
  #bet = "e9 50; a15 20; small 50; double 20"
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
