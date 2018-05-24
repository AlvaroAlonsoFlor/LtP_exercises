=begin
Write a program that lets you enter commands such as feed and walk.
Since we are putting just string we need a dispatch method that checks
which string was entered and then calls the appropiate method
=end

class BabyDragon
  attr_accessor :name
  def initialize (name)
    @name = name
    @stamina = 10 #10 not tired 0 really tired
    @food = 10 #10 not hungry 0 starving
    @poop_alert = 0 #when it reaches 10 poop
    @alive = true
    command
  end

  def command #A function to check the comands, instead of dispatch
    if @alive == false
      puts "You are dead, ghosts can't take care of dragons"
      @action = "exit"

    else
      puts "What do you want to do with #{@name}?(feed, walk, sleep, exit)"
      @action = gets.chomp.downcase


      while @action != "exit"
        if @action == "feed"
          feed

        elsif @action == "walk"
          walk

        elsif @action == "sleep"
          sleeping

        else
          puts "Please write a valid option"

        end
        command
        break if @action == "exit"
      end

    end

  end


  private

  #MAIN ACTIONS
  def feed #A function for feeding
    puts "You feed #{@name}. #{@name} devour the food in seconds"
    @food = 11 #We go 1 number above max so when the time passes is 10
    @poop_alert += 2
    time_passes
  end

  def walk #A function for walking
    puts "You take #{@name} for a walk. #{@name} is now a wee fit dragon"
    @stamina -=2
    time_passes
  end

  def sleeping
    @stamina = rand(3..10)
    case @stamina
    when 3..5 then puts "#{@name} didn't sleep very well.
                         #{@name} might need some more rest"
    when 6..8 then puts "#{@name} slept well. #{@name} is ready for more adventures"
    else
      puts "#{@name} slept really well! Let's do something amazing with all that energy!"

    end
    @food -= 2
    @poop_alert += 2
  end

  #TRIGGERED ACTIONS
  def poop #poop event
    puts "#{@name} needs to go for a number 2. #{@name} flies to the sea...and drops the cargo"
    @stamina -= 1
    @poop_alert = 0
  end

  def time_passes
    #We make sure that food and stamina aren't under 0 with ternary operators
    @stamina > 0 ? @stamina -= 1 : @stamina = 0
    @food > 0 ? @food -= 1 : @food = 0
    @poop_alert += 1 if @food > 0 #No food no poop

    case @stamina
    when 2..4 then puts "#{@name} looks tired, maybe is time to go to sleep"
    when 0..1
      puts "#{@name} stop listening you and goes to sleep"
      sleeping
    end

    case @food
    when 2..4 then puts "#{@name} seems to be hungry, better go and get some food"
    when 1 then puts "Seriously, #{@name} is really hungry, something bad will happen if you don't do anything"
    when 0
      @alive = false
      puts "I told you, now you are #{@name} dinner. Never annoy a dragon. You die"
    end

    poop if @poop_alert >= 10


  end


end

#TEST

dragon = BabyDragon.new("Norbert")

#TESTING NOTES

#Tested exit

#Loop when walk, is tired and have to poo = solved eliminating time_passes from poop
#when trying to be killed -17 stamina reached = solved going to sleep when 0..1
#when walked 3 times norbert seems to be hungry x2 = removed time_passes from sleeping

#Dead by starvation not triggered:
#<BabyDragon:0x0000000002eeeba0 @name="Norbert", @stamina=2, @food=-4, @poop_alert=2, @action="exit">
# = solved with ternary operators in time_passes

#Dead implementation not working = solved setting @action to "exit"
