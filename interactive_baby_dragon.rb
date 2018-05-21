=begin
Write a program that lets you enter commands such as feed and walk.
Since we are putting just string we need a dispatch method that checks
which string was entered and then calls the appropiate method
=end

class BabyDragon
  def initialize
    @name = name
    @stamina = 10 #from 0 to 10
    @food = 10 #from 0 to 10
    @poop_alert = 0 #when it reaches 10 poop
    command
  end

  def feed #A function for feeding
    puts "You feed #{@name}. #{@name} devour the food in seconds"
    @food = 11 #We go 1 number above max so when the time passes is 10
    time_passes
  end

  def walk #A function for walking
  end

  def sleep
    @stamina = rand(3..10)
    case @stamina
    when 3..5 then puts "#{@name} didn't sleep very well.
                         #{@name} might need some more rest"
    when 6..8 then puts "#{@name} slept well. #{@name} is ready for more adventures"
    else
      puts "#{@name} slept really well! Let's do something amazing with
            all that energy!"

    end
  end

  def time_passes
    @stamina -=1
    @food -=1

    case @stamina
    when 2..4 then puts "#{@name} looks tired, maybe is time to go to sleep"
    when 1 then puts "#{@name} stop listening you and goes to sleep" sleep
    end

    case @food
    when 2..4 then puts "#{@name} seems to be hungry, better go and get some food"
    when 1 then puts "Seriously, #{@name} is really hungry, something bad will
                      happen if you don't do anything"
    when 0 then puts "I told you, now you are #{@name} dinner. Never annoy a
                      dragon. You die" #Implement death
    end


  end

  def command #A function to check the comands
    puts "What do you want to do with #{@name}?(feed, walk, sleep)"
    action = gets.chomp.downcase

    #Now call functions with if

    command
  end

  def dispatch #Checks the strings
  end
end
