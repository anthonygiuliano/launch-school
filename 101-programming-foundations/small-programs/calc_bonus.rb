require 'yaml'
require 'pry'

LANGUAGE = 'en'.freeze
MESSAGES = YAML.load_file('calculator_messages.yml')

# binding.pry

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  num =~ /\d/ # returns nil if the string doesn't contain numeric char
end

def operation_to_message(op)
  result =  case op
            when '1'
              'Adding'
            when '2'
              'Subtracting'
            when '3'
              'Multiplying'
            when '4'
              'Dividing'
            end
  return result # explicit return so that other code can be executed above
end

def integer?(input)
  input.to_i.to_s == input
end

def float?(input)
  input.to_f.to_s == input
end

def number?(input)
  integer?(input) || float?(input)
end

def messages(message, lang = 'en')
  MESSAGES[lang][message]
end

prompt(messages('welcome'))

name = nil
loop do
  name = Kernel.gets().chomp()
  break unless name.empty?()
  prompt(messages('valid_name'))
end

prompt(messages('greeting') + name)

loop do # main loop
  number1 = nil
  loop do
    prompt(messages('get_first_num'))
    number1 = Kernel.gets().chomp()

    break if valid_number?(number1)
    prompt(messages('invalid_number'))
  end

  number2 = nil
  loop do
    prompt(messages('get_second_num'))
    number2 = Kernel.gets().chomp()

    break if valid_number?(number2)
    prompt(messages('invalid_number'))
  end

  prompt(messages('operator_prompt'))

  operator = nil
  loop do
    operator = Kernel.gets().chomp()

    break if %w(1 2 3 4).include?(operator)
    prompt(messages('invalid_operator'))
  end

  prompt(operation_to_message(operator) + messages('operation_message'))

  result = case operator
           when '1'
             number1.to_i() + number2.to_i()
           when '2'
             number1.to_i() - number2.to_i()
           when '3'
             number1.to_i() * number2.to_i()
           when '4'
             number1.to_f() / number2.to_f()

           end

  prompt(result)

  prompt(messages('get_repeat'))
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt(messages('thanks'))
