# instance variables are available anywhere within the object
# i.e. object level scope

class Person
  def initialize(n)
    @name = n
  end

  def get_name
    @name
  end
end

bob = Person.new('bob')
bob.get_name # => "bob"

# references to uninitialized instance vars return nil, not NameError

class Person2
  def get_name
    @name # !> instance variable @name not initialized
  end
end

bob = Person2.new
bob.get_name # => nil

# instance variables initialized at the class level are class instance variables

class Person3
  @name = 'bob'

  def get_name
    @name # !> instance variable @name not initialized
  end

  def self.get_name
    @name
  end
end

bob = Person3.new
bob.get_name # => nil
Person3.get_name # => "bob"

# class vars start with @@ and are initialized at the class level

class Person4
  @@total_people = 0 # initialized at class level

  def self.total_people # accessible from class method
    @@total_people
  end

  def initialize # mutable from instance method
    @@total_people += 1
  end

  def total_people #accessible from instance method
    @@total_people
  end
end

Person4.total_people # => 0
Person4.new
Person4.new
Person4.total_people # => 2

bob = Person4.new
bob.total_people # => 3

joe = Person4.new
joe.total_people # => 4

Person4.total_people # => 4

# constants have lexical scope, accessible from class and instance methods

class Person5
  TITLES = %w(Mr Mrs Ms Dr)

  attr_reader :name

  def self.titles
    TITLES.join(', ')
  end

  def initialize(n)
    @name = "#{TITLES.sample} #{n}"
  end
end

Person5.titles # => "Mr, Mrs, Ms, Dr"
bob = Person5.new('bob')
bob.name # => "Dr bob"
