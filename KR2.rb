module Printable
  def print_info
    puts "Information about the object:"
    instance_variables.each do |var|
      puts "#{var}: #{instance_variable_get(var)}"
    end
  end
end

class Person
  include Printable

  def initialize(name, age, job)
    @name = name
    @age = age
    @job = job
  end
end

example_obj = Person.new("John", 30, "HR")
example_obj.print_info
