require './app/poro/tree_populator'

comment_populator = TreePopulator.new(AncestryModel)
page_populator = TreePopulator.new(ClosureTreeModel)

comment_populator.populate(root_name: 'Deep Page 1', num_child: 1, depth: 25)
page_populator.populate(root_name: 'Deep Page 1', num_child: 1, depth: 25)

20.times.each { |i| comment_populator.populate(root_name: "Shallow Page #{i + 1}", num_child: 2, depth: 3) }
20.times.each { |i| page_populator.populate(root_name: "Shallow Page #{i + 1}", num_child: 2, depth: 3) }

puts "==================== ancestors ===================="
Benchmark.ips do |x|
  x.report("Ancestry") { AncestryModel.find(26).ancestors }
  x.report("CosureTree") { ClosureTreeModel.find(26).ancestors }
  x.compare!
end

puts "==================== descendants ===================="
Benchmark.ips do |x|
  x.report("Ancestry") { AncestryModel.find(1).descendants }
  x.report("ClosureTree") { ClosureTreeModel.find(1).descendants }
  x.compare!
end