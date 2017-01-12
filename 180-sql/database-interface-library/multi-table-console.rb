require 'sequel'

# Create a new database called sequel_multiple_tables using psql
# $ createdb sequel-mulutiple-tables

# Import theater_full.sql
# $ psql sequel-multiple-tables < theater_full.sql

# Within a pry or irb session, create a connection to the PostgreSQL database you created in #1. Store this connection object in the constant DB.

DB = Sequel.connect('postgres://localhost/sequel-multiple-tables')

# Write a query that determines how many tickets have been sold.

ds = DB[:tickets]
ds.count #=> 3783

# Write a query that determines how many different customers purchased tickets to at least one event.

ds.distinct(:customer_id).count #=> 1652

# Write a query that determines what percentage of the customers in the database have purchased a ticket to one of the events.

DB[:customers].select {
  (count(tickets__customer_id).distinct / count(customers__id).distinct.cast(Float) * 100).as(:percent)
}.left_outer_join(:tickets, customer_id: :id).first

# Write a query that returns the name of each event and how many tickets were sold for it, in order from most popular to least popular.

DB[:events].select {[events__name, count(tickets__id)]}.inner_join(:tickets, event_id: :id).group(:events__id).order { count(tickets__id) }.reverse.all

# Write a query that returns the user id, email address, and number of events for all customers that have purchased tickets to three or more events.

DB[:customers].select {
  [customers__id, customers__email, count(tickets__event_id).distinct]
  }.inner_join(:tickets, customer_id: :id).group(:customers__id).having {
    count(tickets__event_id).distinct >= 3
  }.all

DB[:customers].inner_join(:tickets, customer_id: :id).select {
  [customers__id, customers__email, count(tickets__event_id).distinct]
}.group(:customers__id).
  having {
    count(tickets__event_id).distinct >=3
}.all

# Write a query to print out the data needed for a report of all tickets purchased by the customer with the email address 'gennaro.rath@mcdermott.co'. The report will include the event name and starts_at and the seat's section name, row, and seat number.

DB[:customers].
  inner_join(:tickets, tickets__customer_id: :customers__id).
  inner_join(:events, events__id: :tickets__event_id).
  inner_join(:seats, seats__id: :tickets__seat_id).
  inner_join(:sections, sections__id: :seats__section_id).
  select {
    [events__name.as(event), events__starts_at, sections__name.as(section), seats__row, seats__number]
  }.
  where(customers__email: 'gennaro.rath@mcdermott.co').
  all
