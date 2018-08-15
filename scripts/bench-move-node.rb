def ct_move_node(root_id, dest_id)
  x = ClosureTreeModel.find(root_id)
  x.parent = ClosureTreeModel.find(dest_id)
  x.save
  x.parent = nil
  x.save
end

def an_move_node(root_id, dest_id)
  x = AncestryModel.find(root_id)
  x.parent = AncestryModel.find(dest_id)
  x.save
  x.parent = nil
  x.save
end


puts "\n==================== Moving a node with 14 descendants: ===================="
root_id, dest_id = 27, 26
Benchmark.ips do |x|
  x.report("Ancestry") { an_move_node(root_id, dest_id) }
  x.report("ClosureTree") { ct_move_node(root_id, dest_id) }
  x.compare!
end

puts "\n==================== Moving a node with 25 descendants: ===================="
root_id, dest_id = 1, 30
Benchmark.ips do |x|
  x.report("Ancestry") { an_move_node(root_id, dest_id) }
  x.report("ClosureTree") { ct_move_node(root_id, dest_id) }
  x.compare!
end