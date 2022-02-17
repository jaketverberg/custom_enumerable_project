# frozen_string_literal: true

module Enumerable
  # Your code goes here
  def my_each_with_index
    return self.to_enum unless block_given?

    self.size.times { |i| yield self[i], i }
    self
  end

  def my_all?(&block)
    self.my_each { |i| return false unless block.call(i) }
    true
  end

  def my_any?(&block)
    self.my_each { |i| return true if block.call(i) }
    false
  end

  def my_count(&block)
    return self.size unless block_given?
    counter = 0
    self.my_each { |i| counter += 1 if block.call(i) }
    counter
  end

  def my_inject(accumulator, &block)
    unless accumulator
      accumulator = self.first
      for i in 0..self.size-2
        accumulator = block.call(accumulator, self[i + 1])
      end
    end
    if accumulator
      for i in 0..self.size-1
        accumulator = block.call(accumulator, self[i])
      end
    end
    accumulator
  end

  def my_map(&block)
    new_map = []
    return to_enum unless block_given?

    self.my_each { |i| new_map.push(block.call(i)) }
    new_map
  end

  def my_none?(&block)
    self.my_each { |i| return false if block.call(i) }
    true
  end

  def my_select(&block)
    selection = []
    self.my_each { |i| selection.push(i) if block.call(i) }
    selection
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    return to_enum unless block_given?

    for k, v in self do
      yield k, v
    end
  end
end

arr = [1, 1, 2, 3, 5, 8, 13, 21, 34]

arr.my_map
