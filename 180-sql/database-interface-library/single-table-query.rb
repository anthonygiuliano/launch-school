require 'sequel'

def format_money(numeric)
  format("$%0.2f", numeric)
end

DB = Sequel.connect('postgres://localhost/sequel-single-table')

results = DB[:menu_items].select do
  [item,
    menu_price,
    ingredient_cost,
    Sequel.expr((prep_time * 12.0 / 60)).
           cast(:float).
           as(:labor),
    (menu_price - ingredient_cost - (prep_time * 12 / 60)).as(:profit)]
end

results.each do |r|
  puts r[:item]
  puts "menu price: #{format_money(r[:menu_price])}"
  puts "ingredient cost #{format_money(r[:ingredient_cost])}"
  puts "labor: #{format_money(r[:labor])}"
  puts "profit: #{format_money(r[:profit])}"
  puts
end
