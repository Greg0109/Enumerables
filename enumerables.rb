module Enumerables
  def my_each(block=nil)
    i = 0
    if block_given?
      length.times do
        if block != nil
          block.call(self[i])
        else
          yield(self[i])
        end
        i += 1
      end
    else
      self
    end
  end

  def my_each_with_index(block=nil)
    i = 0
    if block_given?
      length.times do
        if block != nil
          block.call(self[i], i)
        else
          yield(self[i], i)
        end
        i += 1
      end
    else
      self
    end
  end

  def my_select(block=nil)
    i = 0
    if block_given?
      length.times do
        if block != nil
          puts self[i] if block.call(self[i])
        else
          puts self[i] if yield(self[i])
        end
        i += 1
      end
    else
      self.my_each
    end
  end

  def my_all?(match=nil)
    i = 0
    statement = true
    if block_given?
      length.times do
        statement = false unless yield(self[i])
        i += 1
      end
    elsif match != nil
      length.times do
        begin
          if self[i].is_a?(match)
            statement = false
          end
        rescue
          if self[i].scan(match)
            statement = false
          end
        end
      end
    end
    statement
  end

  def my_none?(match=nil)
    i = 0
    statement = false
    if block_given?
      length.times do
        statement = true unless yield(self[i])
        i += 1
      end
    elsif match != nil
      length.times do
        begin
          if self[i].is_a?(match)
            statement = true
          end
        rescue
          if self[i].scan(match)
            statement = true
          end
        end
      end
    else
      length.times do
        return true if self[i] == true
      end
    end
    statement
  end

  def my_any?(match=nil)
    i = 0
    statement = false
    if block_given?
      length.times do
        return true if yield(self[i])
        i += 1
      end
    elsif match != nil
      length.times do
        begin
          if self[i].is_a?(match)
            statement = true
          end
        rescue
          if self[i].scan(match)
            statement = true
          end
        end
      end
    else
      length.times do
        return true if self[i] != false or !self[i].nil?
      end
    end
    statement
  end

  def my_count(match=nil)
    i = 0
    if block_given?
      c = 0
      length.times do
        c += 1 if yield(self[i])
        i += 1
      end
      c
    elsif match != nil
      c = 0
      length.times do
        if self[i] == match
          c += 1
        end
        i += 1
      end
      return c
    else
      length.times do
        i += 1
      end
      i
    end
  end

  def my_map(block = nil)
    i = 0
    new_array = []
    my_array = Array.new
    if self.respond_to?(:to_ary)
      my_array = self
    else
      my_array = self.to_a
    end
    if !block.nil?
      my_array.length.times do
        new_array.push(block.call(my_array[i]))
        i += 1
      end
    else
      my_array.length.times do
        new_array.push(yield(my_array[i]))
        i += 1
      end
    end
    new_array
  end

  def my_inject(block=nil)
    my_array = Array.new
    if self.respond_to?(:to_ary)
      my_array = self
    else
      my_array = self.to_a
    end
    if block != nil
      my_array.my_inject { |sum, x| sum + x }
    else
      if block_given?
        accumulator = my_array[0]
        my_array.my_each_with_index do |n, i|
          accumulator = yield(accumulator, n) if i != 0
        end
        accumulator
      end
    end
  end
end

def multiply_els(array)
  array.my_inject { |sum, n| sum * n }
end

include Enumerables
testarray = [1,2,3,4,5,6,7,8]
testarray.my_each { |x| puts "My number is #{x}"}
puts testarray.my_select
