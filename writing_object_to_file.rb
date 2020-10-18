#!/usr/bin/ruby

#convert object to CSV
require 'csv'

class Person
  attr_accessor :first_name, :last_name

  def valid?
    (!first_name.nil? && first_name.length > 0)  &&
    (!last_name.nil? && last_name.length > 0)
  end

  def to_csv
    CSV.generate do |csv|
      csv << [first_name, last_name]
    end
  end
end

person1 = Person.new
person1.first_name = "Bob"
person1.last_name = "Smith"

p person1.to_csv

#major functons "CRUD" = create, read, update, delete

#writing objects to file

class Person
  attr_accessor :first_name, :last_name, :person_id

  def valid?
    (!first_name.nil? && first_name.length > 0)  &&
    (!last_name.nil? && last_name.length > 0)
  end

  def save
    save_file = CSV.open("#{person_id}-file.csv", "w") do |csv|
      csv << [first_name, last_name]
    end

    return !save_file.nil?
  end
end

person1 = Person.new
person1.first_name = "Bob"
person1.last_name = "Smith"
person1.person_id = '114514'
puts person1.save