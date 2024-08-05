module Enumerable
  # my_each_with_index
  def my_each_with_index
    index = 0
    self.each do |item|
      yield(item, index)
      index += 1
    end
  end

  # my_select
  def my_select
    result = []
    self.each do |item|
      result << item if yield(item) 
    end
    result
  end

  # my_all?
  def my_all?
    self.each { |item| return false unless yield(item) }
    true
  end

  # my_any?
  def my_any?
    self.each { |item| return true if yield(item) }
    false
  end

  # my_none?
  def my_none?
    self.each { |item| return false if yield(item) }
    true
  end

  # my_count
  def my_count
    count = 0
    if block_given?
      self.each do |item|
        count += 1 if yield(item)
      end
    else
      return self.size
    end
    count
  end

  # my_map
  def my_map
    new_array = []
    for item in self
      new_array << yield(item)
    end
    new_array
  end

  # my_inject
  def my_inject(accumulator)
    self.each do |item|
      accumulator = yield(accumulator, item)
    end
    accumulator
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for item in self
      yield(item)
    end
  end
end
