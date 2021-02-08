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
        i = 1
        array.length.times do
            if yield(array[i])
                puts array[i]
            end
            i += 1
        end
    end
end

include Enumerables
testarray = [1,2,3,4,5,6,7,8]
Enumerables.my_each(testarray) { |x,y| puts "The number is #{x}" }
Enumerables.my_each_with_index(testarray) { |index,val| puts "index: #{index} for #{val}"}
Enumerables.my_select(testarray) { |n| n.even? }