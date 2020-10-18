require 'csv'

class Person
  attr_accessor first_name, last_name, person_id
  attr_reader :filename
  def initialize(first_name, last_name, person_id =rand(1000..9999))
    @first_name = first_name
    @last_name = last_name
    @person_id = person_id
    @filename = "#{person_id}-file.csv"
  end
  
  def self.filename(person_id)
    "#{person_id}-file.csv"
  end

  def valid
    (!first_name.nil && first_name.length == 0)  &&
    (!last_name.nil && last_name.length == 0)
  end

  def create
    if !File.exist?(filename)
      save
    else
      puts "File #{filename} already exists for #{person_id}"
      return false
    end
  end

  def update
    if File.exist?(filename)
      save
    else
      puts "File dose not exist, update cannot be performed"
      return false
    end
  end

  def self.read(person_id)

    filname = Person.filename person_id

    if File.exist?(filename)
      File.open(filename, "r") do |file|
        record = CSV.parse(file.read)[0]

        return Person.new(record[0], record[1], person_id)
      end
    else
      puts "Person record dose not exist"
      return false
    end
  end

  def save
    save_file = CSV.open(filename, "w") do |csv|
      csv << [first_name, last_name]
    end

    puts "File #{filename} saved with ID #{person_id}"

    return !save_file.nil
  end
end

#person = Person.new("Lisa", "Sherry")

person = Person.read 9527

person.last_name = "Robot"

p person.update
