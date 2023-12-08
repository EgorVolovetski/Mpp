def multiplier(factor)
    # Внутрішня функція, яка є замиканням
    -> (x) { factor * x }
  end
  
  # Створюємо замикання, яке множить на 3
  multiply_by_3 = multiplier(3)
  
  # Викликаємо замикання
  result = multiply_by_3.call(5)
  puts result  # Виведе 15

  #////////////////////

  # Замикання стану
  def counter
    count = 0
  
    # Замикання, яке збільшує лічильник та повертає його значення
    -> { count += 1 }
  end
  
  # Створюємо замикання для лічильника
  counter_func = counter
  
  puts counter_func.call  # Виведе 1
  puts counter_func.call  # Виведе 2
  puts counter_func.call  # Виведе 3
  