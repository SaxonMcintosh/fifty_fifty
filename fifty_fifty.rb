# fifty_fifty is a small game that I'm working on to flex my Ruby
# muscles, but I'm still an absolute novice so I'll be learning a lot
# as I go on.

# This is essentially functioning as Main, but I'm sure it could be
# reworked once I know more about what it means to be "idiomatically
# Ruby-esque.
class Menu
  def initialize
    puts "\nPlease select an option."
    puts "\nFight\tStore\tSave\tEnd"
    input
  end

  def input
    user_in = gets.chomp
    user_in.downcase!

# So far, the fight option is the one of gotten to.
    if user_in == "fight"
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
    end
  end

  # The basic concept is that initially, the player character has a
  # 50/50 chance of defeating a spawned monster. Eventually, each time
  # they succeed they will earn a number of points that they can use to 
  # redeem upgrades, which will stack. Like a freemium phone game sans
  # real cash.
  def fight
    play = Fighter.new
    play.health = 1

    monst = Fighter.new
    monst.health = 1

    while play.health > 0 && monst.health > 0 do
      # This looks unusual presently, but eventually the monsters and
      # player will have greater health. I also intend to add a monster
      # counter to help differentiate battles in the console window.
      puts "\nPlayer HP: #{play.health}\tMonster HP: #{monst.health}."
      puts "\nAttacking monster!"
      if rand.round == 1
        monst.health -= 1
        puts "\nVictory!"
        sleep(1)
        fight
      else
        play.health -= 1
        puts "\nDefeat!"
      end
    end
  end
end

class Fighter
  attr_accessor :health
  attr_accessor :damage
end

first = Menu.new
