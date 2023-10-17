def convert_int_to_roman(num)
    if num >= 1000
        return ('M' + convert_int_to_roman(num-1000))
    end
    
    if num >= 500
        return num >= 900? 'CM' + convert_int_to_roman(num-900): 'D' + convert_int_to_roman(num-500)
    end

    if num >=100
        return num>=400? 'CD' + convert_int_to_roman(num-400) : 'C' + convert_int_to_roman(num-100)
    end

    if num>=50
        return num>=90? 'XC' + convert_int_to_roman(num-90) : 'L' + convert_int_to_roman(num-50)
    end

    if num >= 10
        return num >= 40? 'XL' + convert_int_to_roman(num-40) : 'X' + convert_int_to_roman(num-10)
    end

    if num >= 5
        return num==9? 'IX' + convert_int_to_roman(num-9) : 'V' + convert_int_to_roman(num-5)
    end

    if num > 0
        return num==4? 'IV' : 'I' + convert_int_to_roman(num - 1)
    end
    return ''
end

def convert_roman_to_int(roman)
    roman_numerals = {
      'I' => 1,
      'V' => 5,
      'X' => 10,
      'L' => 50,
      'C' => 100,
      'D' => 500,
      'M' => 1000
    }
  
    arabic = 0
    prev_value = 0
  
    roman.reverse.each_char do |char|
      value = roman_numerals[char]
      if value < prev_value
        arabic -= value
      else
        arabic += value
      end
      
      prev_value = value
    end
  
    return arabic
  end

print "Choose roman in int(1) or int in roman(2) => "
choice = gets.chomp.to_i

case choice
when 1
    print ("Enter a roman nummer => ")
    roman = gets.chomp
    print "Your number in arabic is "
    puts convert_roman_to_int(roman)
when 2
    print ("Enter an arabic nummer => ")
    num = gets.chomp.to_i
    puts "Your number in roman is " + convert_int_to_roman(num)
end


