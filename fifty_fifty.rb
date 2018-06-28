# fifty_fifty is a small game that I'm working on to flex my Ruby
# muscles, but I'm still an absolute novice so I'll be learning a lot
# as I go on. The basic concept is that initially, the player character
# has a 50/50 chance of defeating a spawned monster. Eventually, each
# time they succeed they will earn a number of points that they can use
# to redeem upgrades, which will stack. Like a freemium phone game sans
# real cash.

class Fighter
  attr_accessor :health
  attr_accessor :damage
end

def fight
  play = Fighter.new
  play.health = 1
    
  while play.health > 0 do
    # Instantiates a new monster object, then loops through accumulating
    # points and producing visual output every time a monster is
    # defeated. When the player runs out of health, the loop is aborted.
    # Sleep is instituted to make the display easier to follow.
    monst = Fighter.new
    monst.health = 1

    puts "\nHere comes monster ##{$monst_count + 1}!"
    sleep 0.5
    puts "\nPlayer HP: #{play.health}\tMonster HP: #{monst.health}"
    sleep 0.5
    puts "\nAttacking monster..."
    sleep 0.5
    
    if rand.round == 1
      monst.health -= 1
      puts "\nVictory!"
      $monst_count += 1
      $points += 1
      # Eventually this will clog the terminal with splats, but for the
      # time being it adequately breaks up the display.
      puts "Bodies left in your wake: #{'*' * $monst_count}"
      sleep 0.5
    else
      play.health -= 1
      puts "\nDefeat!"
    end
  end
  sleep 1
  menu
end

def menu
  puts "\nPlease select an option."
  puts "\nFIGHT-f\tSTORE\tSAVE\tEND"

  user_in = gets.chomp
  user_in.downcase!

  if user_in == "fight" || user_in == "f"
    puts "\nAlright, let\'s go."
    fight
  elsif user_in == "store"
    puts "\nWe'll find some good stuff."
  elsif user_in == "save"
    puts "\nSaving this session for you."
  elsif user_in == "end"
    puts "\nExiting; it's been a pleasure!"
  else
    puts "\nTry typing that again."
    menu
  end
end

$monst_count = 0
$points = 0

menu

# Visual output for when I begin writing these variables to file.
puts $monst_count, $points
