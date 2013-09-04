# It is IMPORTANT how we spell things - including capitals (notice CamelCase 
# for the class names and _ and lower case for the files names
# zoo_cage.rb => class ZooCage

class Cage
  attr_accessor :animal
end

class Animal
  attr_accessor :name, :age, :origin # BOTH

  # attr_reader :name # GETTER / READER
  # attr_writer :name # SETTER / WRITER

  # WHEN WE CREATE NEW ANIMAL with new() method
  # this is being called
  def initialize(n="NewBorn", age=0)   #n="NewBorn")
    @name = n
    @age  = age
  end

  # GETTER / READER 
  # NOW REDUNDANT AS WE ALREADY HAVE NAME IN 
  # ATTR_ACCESSOR
  def name
    @name
  end

  # SETTER / WRITER
  # NOW REDUNDANT AS WE ALREADY HAVE NAME IN 
  # ATTR_ACCESSOR
  def name=(n)
    @name = n
  end

  # this users another method
  # to print it's value
  def tell_me_your_name
    puts name
  end

  def make_older_by_year
    @age = @age + 1
  end

  # animal makes a noise
  def make_noise
    raise "You have to implement this method in your class"
  end
end

class Dog < Animal
  attr_writer :dob

  def make_noise
    "Wuw wuw!!"
  end
end

class Cat < Animal
  attr_reader :dob

  def make_noise
    "meau meau!"
  end
end











class PerformingAnimal < Animal
  def stunt
    "Tadada!"
  end
end

class Tiger < PerformingAnimal
  def make_noise
    return "Roaaaaar!!!"
  end

  def consume
   return "Tiger consumes his meal #{roar}"
  end
end

