module Enumerables
    def my_each(array)
        i = 1
        array.length.times do
            yield(i)
            i += 1
        end
    end
    def my_each_with_index(array)
        i = 1
        array.length.times do
            yield(i-1,i)
            i += 1
        end
    end
    def my_select(array)
        i = 0
        array.length.times do
            if yield(array[i])
                puts array[i]
            end
            i += 1
        end
    end

    def my_all(array)
        i = 0
        statement = true
        array.length.times do
            if !yield(array[i])
                 statement = false
            end
            i += 1
        end
        return statement
    end

    def my_none(array)
        i = 0
        statement = false
        array.length.times do
            if !yield(array[i])
                 statement = true
            end
            i += 1
        end
        return statement
    end

    def my_any(array)
        i = 0
        statement = false
        array.length.times do
            if yield(array[i])
                 return true
            end
            i += 1
        end
        return statement
    end

end

include Enumerables
testarray = [1,2,3,4,5,6,7,8]
Enumerables.my_each(testarray) { |x,y| puts "The number is #{x}" }
Enumerables.my_each_with_index(testarray) { |index,val| puts "index: #{index} for #{val}"}
Enumerables.my_select(testarray) { |n| n.even?}
puts Enumerables.my_all(testarray) { |n| n < 20}
puts Enumerables.my_none(testarray) { |n| n < 20}
puts Enumerables.my_any(testarray) { |n| n == 20}