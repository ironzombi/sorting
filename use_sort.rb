require_relative 'sort'
require 'colorize'
require 'benchmark'

class Sorting_Program

 def menu_text
 
   print "Sorting is Sorted Son\n".colorize(:yellow)
   print "_____________________\n".colorize(:pink)
   puts  "1-Generate numbers".colorize(:white)
   puts  "2-Bubble sort them".colorize(:green)
   puts  "3-Shell sort them".colorize(:green)
   puts  "4-Insert Sort them".colorize(:green)
   puts  "5-what are the numbers ??".colorize(:white)
   puts  "6-Write Numbers to File".colorize(:blue)
   puts  "anything else = EXIT".colorize(:red)

 end


 def main_menu
  
   system('clear')
   num = []
   old_num = []
    loop do 
   menu_text
   ans = gets.to_i
   case ans
   when 1
      num = num_gen
      old_num = num.dup
   when 2
     num = old_num.dup
     bub = Sort.new
     t = Benchmark.measure do
     p bub.bubble(num)
     end
     puts "\n Sorting completed:#{t}"
   when 3
     num = old_num.dup
     shel = Sort.new
     t = Benchmark.measure do
     p shel.shell(num)
     end
     puts "\nSorting completed:#{t}"
   when 4
     num = old_num.dup
     ins = Sort.new
     t = Benchmark.measure do
     p ins.insert(num)
     end
     puts "\nSorting completed:#{t}"
   when 5
     puts "Sorted Numbers:"
     p num
     puts "Unsorted Numbers"
     p old_num
   when 6
     write_file(num)
   else
     puts "EXITING NOW PIP!"
     exit
   end
  end

 end


 def num_gen
  
   numbers = []
  
   puts "NUMBER GENERATOR PROGRAM-APPLICATION"
   puts "how many numbers to generate ?"
   print ":"
   amount = gets.to_i
  
   puts "Largest number in set ?"
   size = gets.to_i
  
   puts "GENERATING NUMBERS ZERO to #{size}"
   amount.times do 
    numbers << rand(size)
   end
   return numbers

 end

  
 def write_file(num)
   fp = File.new("numbers.txt", "w")
   fp.puts(num)
   fp.close
   puts "#{num} written to file #{fp}"
 end

end

session = Sorting_Program.new
session.main_menu
