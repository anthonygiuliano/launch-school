require 'sequel'

# Create a new database called `sequel-single-table` using psql.
# $ createdb sequel-single-table

# Within a pry or irb session, create a connection to the PostgreSQL database you created in #1. Store this connection object in the constant `DB`.

DB = Sequel.connect('postgres://localhost/sequel-single-table')

# Use Sequel to create the structure for the following table, people. Make sure that `id` is an auto-incrementing primary key.

DB.create_table :people do
  primary_key :id
  String :name
  Integer :age
  String :occupation, null: true
end

# Use a method on the `Sequel::Postgres::Database` object held by `DB` to list the tables in the current database.

DB.tables

# Use a method on the `Sequel::Postgres::Database` object held by `DB` to describe the columns in the table `people`.

DB.schema(:people)

# Use Sequel to to insert the data shown in #3 into the table you just created.

abby = { name: 'Abby', age: 34, occupation: 'biologist' }
mu = { name: "Mu'nisah", age: 26 }
mir = { name: 'Mirabelle', age: 40, occupation: 'contractor' }

DB.from(:people).insert(abby, mu, mir)

# Use Sequel to retrieve the second row of the `people` table in three different ways.

DB[:people].where(id: 2)
DB.from(:people).where(id: 2)

# What class does `Sequel::Dataset#first` return an instance of?

ds = DB[:people]
ds.first.class # => Hash

# What class does Sequel::Dataset#all return an instance of?

ds.all.class # => Array

# Use Sequel to create a table that can hold the following values. None of the columns should allow null values. Use floating-point numbers to represent `length` and `wingspan`.

DB.create_table :birds do
  primary_key :id
  String :name, null: false
  Float :length, null: false
  Float :wingspan, null: false
  String :family, null: false
  Boolean :extinct, null: false
end

# Using the table created in #10, write the SQL statements to insert the data as shown in the listing.

st = { name: 'Spotted Towhee', length: 21.6, wingspan: 26.7, family: 'Emberizidae', extinct: false }
ar = { name: 'American Robin', length: 25.5, wingspan: 36.0, family: 'Turdidae', extinct: false }
gf = { name: 'Greater Koa Finch', length: 18.0, wingspan: 24.0, family: 'Fringillidae', extinct: true }
cp = { name: 'Carolina Parakeet', length: 33.0, wingspan: 55.8, family: 'Psittacidae', extinct: true }
ck = { name: 'Common Kestrel', length: 35.5, wingspan: 73.5, family: 'Falconidae', extinct: false }

DB[:birds].insert(st)
DB[:birds].insert(ar)
DB[:birds].insert(gf)
DB[:birds].insert(cp)
DB[:birds].insert(ck)

# Use Sequel to retrieve all rows from the birds table.

DB[:birds].all

# Use Sequel to find the names and families for all birds that are not extinct, in order from longest to shortest.

ds = DB[:birds].select(:name, :family).where(extinct: false).reverse_order(:length)
ds.all

# Convert the Sequel expression used in the answer to #14 into a SQL string.

ds.sql

# Use Sequel to determine the average, minimum, and maximum wingspan for the birds stored in the birds table.

ds = DB[:birds]
ds.select(Sequel.function(:avg, :wingspan), Sequel.function(:min, :wingspan), Sequel.function(:max, :wingspan))

ds.select do
  [avg(wingspan), min(wingspan), max(wingspan)]
end.first

ds.select{[avg(wingspan), min(wingspan), max(wingspan)]}.first

# Use Sequel to create the table structure shown below, menu_items. Make sure that id is an auto-incrementing primary key. None of the columns should allow null values, and item should be unique.

DB.create_table :menu_items do
  primary_key :id
  String :item, null: false, unique: true
  Integer :prep_time, null: false
  Float :ingredient_cost, null: false
  Integer :sales, null: false
  Float :menu_price, null: false
end

# Use Sequel to insert the data shown in #16 into the table.

omelette = { item: 'omelette', prep_time: 10, ingredient_cost: 1.5, sales: 182, menu_price: 7.99 }
tacos = { item: 'tacos', prep_time: 5, ingredient_cost: 2.0, sales: 254, menu_price: 8.99 }
oatmeal = { item: 'oatmeal', prep_time: 1, ingredient_cost: 0.5, sales: 79, menu_price: 5.99 }

DB[:menu_items].insert(omelette)
DB[:menu_items].insert(tacos)
DB[:menu_items].insert(oatmeal)

# Using the table and data from the last two questions, use Sequel to determine which menu item is the most profitable based on the cost of its ingredients, returning the name of the item and its profit. Keep in mind that prep_time is represented in minutes and ingredient_cost and menu_price are in dollars and cents):

ds = DB[:menu_items]
ds.select{[item, (menu_price - ingredient_cost).as(profit)]}.reverse_order(:profit).first

# Convert the Sequel expression used in the answer to #18 into a SQL string.

ds.select{[item, (menu_price - ingredient_cost).as(profit)]}.reverse_order(:profit).sql

# Create a file called query.rb. Within it, connect to the same database as before, and execute the same query. Then, the query to take into account how much the employee preparing the item would cost, assuming that person is paid $12 an hour.
