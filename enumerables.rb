module Enumerables
  def my_each
    i = 0
    length.times do
      yield(self[i])
      i += 1
    end
    self
  end

  def my_each_with_index
    i = 0
    length.times do
      yield(self[i], i)
      i += 1
    end
    self
  end

  def my_select
    i = 0
    length.times do
      puts self[i] if yield(self[i])
      i += 1
    end
  end

  def my_all
    i = 0
    statement = true
    length.times do
      statement = false unless yield(self[i])
      i += 1
    end
    statement
  end

  def my_none
    i = 0
    statement = false
    if block_given?
      length.times do
        statement = true unless yield(self[i])
        i += 1
      end
    else
      length.times do
        return true if self[i] == true
      end
    end
    statement
  end

  def my_any
    i = 0
    statement = false
    if block_given?
      length.times do
        return true if yield(self[i])

        i += 1
      end
    else
      length.times do
        return true if self[i] != false or !self[i].nil?
      end
    end
    statement
  end

  def my_count
    i = 0
    if block_given?
      c = 0
      length.times do
        c += 1 if yield(self[i])
        i += 1
      end
      c
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
    if !block.nil?
      length.times do
        new_array.push(block.call(self[i]))
        i += 1
      end
    else
      length.times do
        new_array.push(yield(self[i]))
        i += 1
      end
    end
    new_array
  end

  def my_inject
    accumulator = self[0]
    my_each_with_index do |n, i|
      accumulator = yield(accumulator, n) if i != 0
    end
    accumulator
  end
end

def multiply_els(array)
  array.my_inject { |sum, n| sum * n }
end
