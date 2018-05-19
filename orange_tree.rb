=begin
Make an OrangeTree class that has a height method that returns its height
After a number of years the tree must die
During the first few years the tree should not produce fruit
The production should be increasing with the years (and decreasing at the end?)
Be able to count the oranges and pick one
=end

class OrangeTree
  def initialize
    @height = 0 #cm
    @age = 0
  end

  #method that returns its height
  def height
    puts "Your orange tree is #{@height}cm"
  end

  #A one_year_passes method
  def one_year_passes
    @oranges = 0 #no oranges from the past year
    @age += 1
    check_age
  end

  #A count oranges method
  def count_oranges
    puts "You have #{@oranges} left this year"
  end

  #A pick an orange method
  def pick_orange
    if @oranges == 0
      puts "You don't have any oranges to pick up"
    else
      @oranges -= 1
      puts "The orange was delicious"
    end

  end

  private

  # We need a method to check the age and set production depending on age
  #from 0 to 5 no production 30cm growth, from 6 to 15 10 oranges 10cm growth,
  #from 16 to 45 25 oranges 1cm groth
  #from 46 to 60 10 oranges no growth
  #if 61 die

  def add (height, oranges)
    @height += height
    @oranges += oranges
  end

  def check_age
   case @age
   when 0 .. 5 then add(30, 0)
   when 6 .. 15 then add(10, 10)
   when 16 .. 45 then add(1, 25)
   when 46 .. 60 then add(0, 10)
   else
     puts "Your orange tree died"
   end
  end

end
