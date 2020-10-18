##!/usr/bin/ruby

class Person
  def self.deserves_respect?
    true
  end
ed

puts Person.deserves_respect?
person1 = Person.new
puts person1

puts person1.class.deserves_respect?