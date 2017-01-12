def factors(number)
  dividend = number
  divisors = []
  begin
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end until dividend == 0
  divisors
end

def re_factoreds(number)
  dividend = number
  divisors = []
  while dividend > 0
    # conditional causes only numbers that divide evenly to be added to array
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end
  # explicitly return array of divisors
  divisors
end

p re_factoreds(231)
p re_factoreds(0)
p re_factoreds(-231)