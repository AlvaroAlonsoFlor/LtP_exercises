
#Tree that is able to age, grow and produce oranges every year


class OrangeTree
  def initialize
    @height = 0 #cm
    @age = 0
    @alive = true
  end

  #method that returns its height
  def height
    puts "Your orange tree is #{@height}cm"
    is_alive?
  end

  def age
    puts "The tree age is #{@age}"
    is_alive?
  end

  def one_year_passes
    @oranges = 0 #no oranges from the past year
    @age += 1
    check_age
    is_alive?
  end

  def count_oranges
    puts "You have #{@oranges} left this year"
  end

  def pick_orange
    if @oranges == 0
      puts "You don't have any oranges to pick up"
    else
      @oranges -= 1
      puts "The orange was delicious"
    end

  end

  private

  def add (height, oranges)
    @height += height
    @oranges += oranges
  end

  def is_alive?
    if @alive == false
      @height = 0
      @oranges = 0
      @age = 61
      puts "Your orange tree is not living anymore"
    end
  end

  def check_age
   case @age #Set height and oranges with a function
   when 0 .. 5 then add(30, 0)
   when 6 .. 15 then add(10, 10)
   when 16 .. 45 then add(1, 25)
   when 46 .. 60 then add(0, 10)
   else
     @alive = false
   end
  end

end
