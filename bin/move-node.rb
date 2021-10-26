def ct_move_node(root_id, dest_id)
  x = ClosureTreeTag.find(root_id)
  x.parent = ClosureTreeTag.find(dest_id)
  x.save
  x.parent = nil
  x.save
end

def an_move_node(root_id, dest_id)
  x = AncestryTag.find(root_id)
  x.parent = AncestryTag.find(dest_id)
  x.save
  x.parent = nil
  x.save
end

def rs_move_node(root_id, dest_id)
  x = RecursiveTag.find(root_id)
  x.parent = RecursiveTag.find(dest_id)
  x.save
  x.parent = nil
  x.save
end


puts "\n==================== Moving a node with 14 descendants: ===================="
root_id, dest_id = 27, 26
Benchmark.ips do |x|
  x.report("Ancestry") { an_move_node(root_id, dest_id) }
  x.report("ClosureTree") { ct_move_node(root_id, dest_id) }
  x.report("Recursive") { rs_move_node(root_id, dest_id) }
  x.compare!
end

puts "\n==================== Moving a node with 25 descendants: ===================="
root_id, dest_id = 1, 30
Benchmark.ips do |x|
  x.report("Ancestry") { an_move_node(root_id, dest_id) }
  x.report("ClosureTree") { ct_move_node(root_id, dest_id) }
  x.report("Recursive") { rs_move_node(root_id, dest_id) }
  x.compare!
end
