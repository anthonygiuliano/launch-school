class Person
  attr_accessor :name
  def ==(other_person)
    @name == other_person.name
  end
end

bob = Person.new
bob.name = 'bob'

bob2 = Person.new
bob2.name = 'bob'

# when you define `==` you get `!=` for free!
bob == bob2 # => true
bob != bob2 # => false

bob_copy = bob
bob == bob_copy # => true

45 == 45.0 # => true

45.0.class # => Float
4999999999999999999.class # => Bignum
1234567890123456789.class # => Fixnum
123.class # => Fixnum

arr1 = [1, 2, 3]
arr2 = [2, 3, 4]

arr1 == arr2 # => false

arr2 = [1, 2, 3]
arr1 == arr2 # => true

arr1.object_id # => 70255028217260
arr2.object_id # => 70255036645240

arr3 = arr1

arr1.object_id # => 70255028217260
arr3.object_id # => 70255028217260

arr1 << 4 # => [1, 2, 3, 4]
arr1 # => [1, 2, 3, 4]
arr3 # => [1, 2, 3, 4]

arr1.push(5)
arr1 # => [1, 2, 3, 4, 5]
arr3 # => [1, 2, 3, 4, 5]

arr1 + [6] # => [1, 2, 3, 4, 5, 6]
arr1 # => [1, 2, 3, 4, 5]
arr3 # => [1, 2, 3, 4, 5]

sym1 = :sym
sym2 = :sym

sym1.object_id # => 777628
sym2.object_id # => 777628

int1 = 5
int2 = 5

int1.object_id # => 11
int2.object_id # => 11

string1 = 'string'
string2 = 'string'

string1.object_id # => 70255036604420
string2.object_id # => 70255032623060

num = 25
(1..50) === num # => true

class Fixnum
  def ==(other) # !> method redefined; discarding old ==
    self > other
  end
end

3 == 2 # => true

Person === bob # => true
/test/ === 'retesting' # => true
