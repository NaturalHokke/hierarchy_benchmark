require './app/poro/tree_populator'

comment_populator = TreePopulator.new(AncestryModel)
page_populator = TreePopulator.new(ClosureTreeModel)

puts "==================== Deep Nested ===================="
Benchmark.ips do |x|
  x.report('Ancestry') { comment_populator.populate(root_name: 'Deep Page 1', num_child: 1, depth: 25) }
  x.report('ClosureTree') { page_populator.populate(root_name: 'Deep Page 1', num_child: 1, depth: 25) }
  x.compare!
end

puts "==================== Shallow Nested ===================="
Benchmark.ips do |x|
  x.report('Ancestry') { 20.times.each { |i| comment_populator.populate(root_name: "Shallow Page #{i + 1}", num_child: 2, depth: 3) } }
  x.report('ClosureTree') { 20.times.each { |i| page_populator.populate(root_name: "Shallow Page #{i + 1}", num_child: 2, depth: 3) } }
  x.compare!
end
