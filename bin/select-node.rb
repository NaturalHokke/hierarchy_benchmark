[AncestryTag, ClosureTreeTag, RecursiveTag].each do |klass|
  populator = TreePopulator.new(klass)
  populator.populate(root_name: 'Deep Page 1', num_child: 1, depth: 25)
  20.times.each do |i|
    populator.populate(root_name: "Shallow Page #{i + 1}", num_child: 2, depth: 3)
  end
end

puts "==================== ancestors ===================="
Benchmark.ips do |x|
  x.report("Ancestry") { AncestryTag.find(26).ancestors }
  x.report("CosureTree") { ClosureTreeTag.find(26).ancestors }
  x.report("Recursive") { RecursiveTag.find(26).ancestors }
  x.compare!
end

puts "==================== descendants ===================="
Benchmark.ips do |x|
  x.report("Ancestry") { AncestryTag.find(1).descendants }
  x.report("ClosureTree") { ClosureTreeTag.find(1).descendants }
  x.report("Recursive") { RecursiveTag.find(1).descendants }
  x.compare!
end
