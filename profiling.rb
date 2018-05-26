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
