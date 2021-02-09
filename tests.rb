require_relative 'enumerables'

def multiply_els(array)
  array.my_inject { |sum, n| sum * n }
end

if __FILE__ == $PROGRAM_NAME
  class Tests
    include Enumerables
    test_array = [1, 2, 3, 4, 5, 6, 7, 8]
    test_array.my_each { |x| puts "The number is #{x}" }
    puts
    test_array.my_each_with_index { |val, index| puts "index: #{index} for #{val}" }
    puts
    test_array.my_select { |n| (n % 2).zero? }
    puts
    puts(test_array.my_all { |n| n < 20 })
    puts
    puts(test_array.my_none { |n| n < 20 })
    puts
    puts(test_array.my_any { |n| n == 20 })
    puts
    puts(test_array.my_count { |n| (n % 2).zero? })
    puts
    square = proc { |x| x**2 }
    # puts test_array.my_map { |x| x**2 }
    puts test_array.my_map(square)
    puts
    puts(test_array.my_inject { |sum, n| sum * n })
    puts
    puts multiply_els([2, 4, 5])
  end
end
