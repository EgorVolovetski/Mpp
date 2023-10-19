require 'prime'

def factorial(number)
    return (1..number).reduce(:*) || 1
end

print ("Which task do you want to check 3 or 4?\n=> ")
task = gets.chop.to_i

case task
when 3
    print ("Enter a number for factorial calculation => ")
    number = gets.chop.to_i
    print ("Factorial of your number is ")
    puts factorial(number)
when 4
    print "Enter a number for check simple it or not => "
    prime_num = gets.chop.to_i
    print "Is "
    print prime_num
    print " simple?\n=> "
    puts prime_num.prime?
end
