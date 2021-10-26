populator1 = TreePopulator.new(AncestryTag)
populator2 = TreePopulator.new(ClosureTreeTag)
populator3 = TreePopulator.new(RecursiveTag)

puts "==================== Deep Nested ===================="
Benchmark.ips do |x|
  x.report('Ancestry') { populator1.populate(root_name: 'Deep Page', num_child: 1, depth: 25) }
  x.report('ClosureTree') { populator2.populate(root_name: 'Deep Page', num_child: 1, depth: 25) }
  x.report('Recursive') { populator3.populate(root_name: 'Deep Page', num_child: 1, depth: 25) }
  x.compare!
end

puts "==================== Shallow Nested ===================="
Benchmark.ips do |x|
  x.report('Ancestry') { populator1.populate(root_name: 'Shallow Page', num_child: 2, depth: 3) }
  x.report('ClosureTree') { populator2.populate(root_name: 'Shallow Page', num_child: 2, depth: 3) }
  x.report('Recursive') { populator3.populate(root_name: 'Shallow Page', num_child: 2, depth: 3) }
  x.compare!
end