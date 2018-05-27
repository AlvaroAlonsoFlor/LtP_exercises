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

  #def prof_block (block_description, &block) #Since blocks can't be stored it doesn't make much sense

  def prof(proc_or_lambda)
    @start_time = Time.new
    proc_or_lambda.call
    @duration = Time.new - @start_time
    return "This process took #{@duration} seconds"
  end

  def prof_func(function) #There is no use for this one, just for testing purposes, 0.0 sec
    @start_time = Time.new
    function
    @duration = Time.new - @start_time
    return "This process took #{@duration} seconds"
  end

end

#TEST
my_test = Proc.new do
  number = 0
  1000000.times do
    number += 1
  end
end

my_test_2 = lambda do
  number = 0
  1000000.times do
    number += 1
  end
  return number
end

def my_func
  number = 0
  1000000.times do
    number += 1
  end
  return number
end

#TEST WITH PROC
profile_proc = Profile.new
profile_proc.prof(my_test) #0.4 sec

#TEST WITH LAMBDA
profile_lambda = Profile.new
profile_lambda.prof(my_test_2) #0.4 sec

#TEST WITH FUNCTION
profile_my_func = Profile.new
profile_my_func.prof_func(my_func) #0.0 sec, it calls the method when you define the variable?
