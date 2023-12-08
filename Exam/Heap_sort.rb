def heap_sort(array)
    # Будуємо кучу
    build_max_heap(array)
  
    # Сортуємо елементи
    (array.length - 1).downto(1) do |i|
      array[0], array[i] = array[i], array[0] # Обмін кореня та останнього елемента
      max_heapify(array, 0, i - 1) # Відновлюємо властивості кучі
    end
  
    array
  end
  
  def build_max_heap(array)
    # Знаходимо індекс останнього батьківського вузла
    start_index = (array.length - 2) / 2
  
    # Відновлюємо властивості кучі для кожного батьківського вузла
    start_index.downto(0) do |i|
      max_heapify(array, i, array.length - 1)
    end
  end
  
  def max_heapify(array, root, max_index)
    left_child = 2 * root + 1
    right_child = 2 * root + 2
    largest = root
  
    # Знаходимо найбільший елемент серед кореня, лівого та правого дочірніх вузлів
    largest = left_child if left_child <= max_index && array[left_child] > array[largest]
    largest = right_child if right_child <= max_index && array[right_child] > array[largest]
  
    # Якщо найбільший елемент не корінь, то міняємо їх місцями і рекурсивно викликаємо для піддерева
    if largest != root
      array[root], array[largest] = array[largest], array[root]
      max_heapify(array, largest, max_index)
    end
  end
  
  # Приклад використання
  array = [4, 10, 3, 5, 1]
  sorted_array = heap_sort(array.dup)
  puts "Original array: #{array}"
  puts "Sorted array: #{sorted_array}"
  