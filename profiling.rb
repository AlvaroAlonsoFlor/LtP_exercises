=begin

EXAMPLE FROM THE BOOK

def profile(block_description, &block)
  start_time = Time.new
  block.call
  duration = Time.new - start_time
end

profile '25000 doublings' do
  number = 1

  25000.times do
    number = number + number
  end

  puts "#{number.to_s.length} digits"

end

profile 'count to a million' do
  number = 0
  1000000.times do
    number += 1
  end
end

=end

#EVEN BETTER PROFILING
#The solution only contemplates turning on an off the function with a simple if/else
# if profiling_on = true do everything, otherwise just block.call
#But what if I do a class and that way we can call it when we need it

class Profile

  def initialize
  end
  #def prof_block (block_description, &block) #Since blocks can't be stored it doesn't make much sense

  def prof_proc(proc1)
    @start_time = Time.new
    proc1.call
    @duration = Time.new - start_time
    puts "This process took #{@duration}"
  end


  def prof_method #Let's see if I can do it with methods as well
  end

end

#TEST
my_test = Proc.new do
  number = 0
  1000000.times do
    number += 1
  end
end
