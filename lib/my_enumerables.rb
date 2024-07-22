module Enumerable
  # Your code goes here
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    for item in self
      yield(item)
    end
  end

  def my_each_with_index(start_index = 0)
    index = start_index
    for item in self
      yield(item, index)
      index += 1
    end
    self
  end

  def my_all?
    return true unless block_given?

    for item in self
      return false unless yield(item)
    end

    true
  end

  def my_any?
    return true unless block_given?

    for item in self
      return true if yield(item)
    end

    false
  end

  def my_count
    if block_given?
      cc = 0
      for item in self
        cc += 1 if yield(item) == true
      end
      return cc
    else
      self.size
    end
  end

  def my_inject(initial = nil)
    result = initial.nil? ? self[0] : yield(initial, self[0])
    for item in self[1..-1]
      result = yield(result, item)
    end
    result
  end

  def my_map
    new_arr = []
    for item in self
      new_arr << yield(item)
    end
    new_arr
  end

  def my_none?
    return self unless block_given?

    for item in self
      return false if yield(item)
    end

    true
  end

  def my_select
    new_arr = []
    for item in self
      new_arr << item if yield(item) == true
    end
    new_arr
  end
end
