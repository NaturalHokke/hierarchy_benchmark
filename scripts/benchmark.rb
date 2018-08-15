puts "Resetting DB"
puts "------------"
puts `rails db:schema:load`

puts "\n==================== Populating data ===================="
require_relative 'populate-tree'

`rails db:schema:load`
puts "\n==================== Select benchmark ===================="
require_relative 'bench-select'

puts "\n==================== Move node benchmark ===================="
require_relative 'bench-move-node'
