module Enumerables
    def my_each
        i = 1
        self.length.times do
            yield(i)
            i += 1
        end
    end

    def my_each_with_index
        i = 1
        self.length.times do
            yield(i,i-1)
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

    def my_map
        i = 0
        newArray = Array.new
        self.length.times do
            newArray.push(yield(self[i]))
            i += 1
        end
        return newArray
    end

    def my_inject
        i = 0
        count = |sum|
        n = |n|
        self.length.times do
            yield
            n = self[i]
            i += 1
        end
        return count
    end
end

include Enumerables
testarray = [1,2,3,4,5,6,7,8]
testarray.my_each { |x| puts "The number is #{x}" }
testarray.my_each { |x| puts "The number is #{x}" }
testarray.my_each_with_index { |val,index| puts "index: #{index} for #{val}" }
testarray.my_select { |n| n.even? }
puts testarray.my_all { |n| n < 20 }
puts testarray.my_none { |n| n < 20 }
puts testarray.my_any { |n| n == 20 }
puts testarray.my_count { |n| n.even? }
puts testarray.my_map { |n| n+1 }
