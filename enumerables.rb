module Enumerables
    def my_each(array)
        i = 1
        array.length.times do
            yield(i)
            i += 1
        end
    end
end

include Enumerables
testarray = [1,2,3,4,5,6,7,8]
Enumerables.my_each(testarray) { |x,y| puts "The number is #{x}" }