puts "Resetting DB"
puts "------------"
puts `rails db:schema:load`

puts "\n========================= Populating data ========================="
require_relative 'populate'

`rails db:schema:load`
puts "\n========================= Select benchmark ========================="
require_relative 'select-node'

puts "\n========================= Move benchmark ========================="
require_relative 'move-node'
