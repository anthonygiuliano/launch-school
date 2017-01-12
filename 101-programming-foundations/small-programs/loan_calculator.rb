# START

# GET loan = loan amount

# Validate loan_amount

# GET apr_annual = APR

# Validate apr_annual

# GET duration_years = duration

# Validate duration_years

# SET apr_monthly = APR / 12, duration_months = duration * 12

# Calculate monthly payments

# PRINT monthly payments

# END

require 'pry'
require 'yaml'

MESSAGES = YAML.load_file('loan_messages.yml')

def prompt(message, method = "puts")
  if method == "puts"
    puts "=> #{message}"
  else
    print "=> #{message}"
  end
end

def wait(num_secs)
  intervals = (num_secs * 4).to_i
  intervals.times do
    print "."
    sleep 0.25
  end
  print "\n"
end

def valid_num?(num)
  # num.scan(/\d*\.?\d*/).join.to_f.round(2)
  !num.scan(/\d*\.?\d*/).join.empty?
end

def string_to_float(num)
  num.scan(/\d*\.?\d*/).join.to_f.round(2)
end

def string_to_int(num)
  num.scan(/^\d*/).join.to_i
end

def get_number(input)
  loop do
    prompt MESSAGES["get_#{input}"]
    number = gets.chomp

    wait(1)

    return number if valid_num?(number)
    prompt MESSAGES['invalid_num']
  end
end

def monthly_payments(amount, years, apr)
  apr /= 100.0 if apr > 1
  monthly_rate = apr / 12.0
  months = years * 12
  payments = amount * ((monthly_rate * (1 + monthly_rate)**months) / (((1 + monthly_rate)**months) - 1))
  format("%.2f", payments)
end

# def format_us_dollars(num)

# end

prompt MESSAGES['welcome']

wait(2)

loan_amount = get_number('loan_amount')
loan_amount = string_to_float(loan_amount)

loan_duration = get_number('loan_duration')
loan_duration = string_to_int(loan_duration)

loan_apr = get_number('loan_apr')
loan_apr = string_to_float(loan_apr)

prompt MESSAGES['sorry1']

wait(1)

prompt MESSAGES['sorry2']

wait(1)

prompt MESSAGES['sorry3']

wait(1)

prompt MESSAGES['finished']

prompt(MESSAGES['monthly_payments'], "print")

puts monthly_payments(loan_amount, loan_duration, loan_apr)
