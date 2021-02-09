module Enumerables
    def my_each
        i = 0
        self.length.times do
            yield(self[i])
            i += 1
        end
    end

    def my_each_with_index
        i = 0
        self.length.times do
            yield(self[i],i)
            i += 1
        end
    end

    def my_select
        i = 0
        self.length.times do
            if yield(self[i])
                puts self[i]
            end
            i += 1
        end
    end

    def my_all
        i = 0
        statement = true
        self.length.times do
            if !yield(self[i])
                 statement = false
            end
            i += 1
        end
        return statement
    end

    def my_none
        i = 0
        statement = false
        self.length.times do
            if !yield(self[i])
                 statement = true
            end
            i += 1
        end
        return statement
    end

    def my_any
        i = 0
        statement = false
        self.length.times do
            if yield(self[i])
                 return true
            end
            i += 1
        end
        return statement
    end

    def my_count
        i = 0
        if block_given?
            c = 0
            self.length.times do
                if yield(self[i])
                    c += 1
                end
                i += 1
            end
            return c
        else
            self.length.times do
                i += 1
            end
            return i
        end
    end

    def my_map(block=nil)
        i = 0
        newArray = Array.new
        if block != nil
            self.length.times do
                newArray.push(block.call(self[i]))
                i += 1
            end
        else
            self.length.times do
                newArray.push(yield(self[i]))
                i += 1
            end
        end
        return newArray
    end

    def my_inject
        accumulator = self[0]
        self.my_each_with_index {
            |n,i| if i != 0
                accumulator = yield(accumulator,n)
            end
        }
        return accumulator
    end
end

def multiply_els(array)
    return array.my_inject { |sum,n| sum * n }
end

include Enumerables
testarray = [1,2,3,4,5,6,7,8]
testarray.my_each { |x| puts "The number is #{x}" }
puts
testarray.my_each_with_index { |val,index| puts "index: #{index} for #{val}" }
puts
testarray.my_select { |n| n.even? }
puts
puts testarray.my_all { |n| n < 20 }
puts
puts testarray.my_none { |n| n < 20 }
puts
puts testarray.my_any { |n| n == 20 }
puts
puts testarray.my_count { |n| n.even? }
puts
square = Proc.new { |x| x**2 }
#puts testarray.my_map { |x| x**2 }
puts testarray.my_map(square)
puts
puts testarray.my_inject { |sum, n| sum * n }
puts
puts multiply_els([2,4,5])
