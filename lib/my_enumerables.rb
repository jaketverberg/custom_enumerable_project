module Enumerable
  # Your code goes here
  def my_each_with_index
    for i in 0..self.size-1
      yield self[i], i
    end
  end


end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each

    for k, v in self do
      yield k, v
    end
  end
end
