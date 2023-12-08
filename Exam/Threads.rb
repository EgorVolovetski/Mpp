# Створення потоків
thread1 = Thread.new do
    5.times { |i| puts "Thread 1 - #{i}" }
  end
  
  thread2 = Thread.new do
    5.times { |i| puts "Thread 2 - #{i}" }
  end
  
  # Очікування завершення обох потоків
  thread1.join
  thread2.join
  
  puts "Main thread finished."
  
#Mutex
mutex = Mutex.new

thread1 = Thread.new do
  mutex.synchronize do
    # Операції над спільним ресурсом
  end
end

thread2 = Thread.new do
  mutex.synchronize do
    # Інші операції над тим самим спільним ресурсом
  end
end

 # Atomic
require 'atomic'

counter = Atomic.new(0)

thread1 = Thread.new do
  counter.increment
end

thread2 = Thread.new do
  counter.decrement
end
