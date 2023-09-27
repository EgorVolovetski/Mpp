def infix_to_rpn(expression)
  precedence = { '+' => 1, '-' => 1, '*' => 2, '/' => 2, '^' => 3 }
  output = []
  stack = []

  tokens = expression.scan(/\d+|\+|-|\*|\/|\^|\(|\)/)

  tokens.each do |token|
    if token.match(/\d+/)
      output << token
    elsif token == '('
      stack << token
    elsif token == ')'
      while stack.last != '('
        output << stack.pop
      end
      stack.pop if stack.last == '('
    else
      while !stack.empty? && precedence[token] <= (precedence[stack.last] || 0)
        output << stack.pop
      end
      stack << token
    end
  end

  while !stack.empty?
    output << stack.pop
  end

  return output.join(' ')
end

loop do
  print " Enter the mathematical expression in the usual form: "
  infix_expression = gets.chomp
  rpn_expression = infix_to_rpn(infix_expression)
  puts "The result is in RPN format: #{rpn_expression}"

  puts " Do you want to enter another expression? (yes/no)"
  play_again = gets.chomp.downcase
  break if play_again != "yes"
end