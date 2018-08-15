# 環境
- MacBook Air (13-inch, Mid 2013)
  - Core i7 1.7GHz
  - 8GB 1600MHz DDR3
- MySQL
  - Server version: 8.0.12 Homebrew

# 結果
```
Resetting DB
------------
-- create_table("ancestry_models", {:options=>"ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", :force=>:cascade})
   -> 0.0357s
-- create_table("closure_tree_model_hierarchies", {:id=>false, :options=>"ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", :force=>:cascade})
   -> 0.0208s
-- create_table("closure_tree_models", {:options=>"ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", :force=>:cascade})
   -> 0.0168s
-- add_foreign_key("closure_tree_models", "closure_tree_models", {:column=>"parent_id"})
   -> 0.0251s
-- create_table("ancestry_models", {:options=>"ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", :force=>:cascade})
   -> 0.0208s
-- create_table("closure_tree_model_hierarchies", {:id=>false, :options=>"ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", :force=>:cascade})
   -> 0.0181s
-- create_table("closure_tree_models", {:options=>"ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", :force=>:cascade})
   -> 0.0164s
-- add_foreign_key("closure_tree_models", "closure_tree_models", {:column=>"parent_id"})
   -> 0.0237s

==================== Populating data ====================
==================== Deep Nested ====================
Warming up --------------------------------------
            Ancestry     1.000  i/100ms
         ClosureTree     1.000  i/100ms
Calculating -------------------------------------
            Ancestry     12.728  (± 7.9%) i/s -     64.000  in   5.037229s
         ClosureTree      3.631  (± 0.0%) i/s -     19.000  in   5.250928s

Comparison:
            Ancestry:       12.7 i/s
         ClosureTree:        3.6 i/s - 3.50x  slower

==================== Shallow Nested ====================
Warming up --------------------------------------
            Ancestry     1.000  i/100ms
         ClosureTree     1.000  i/100ms
Calculating -------------------------------------
            Ancestry      1.138  (± 0.0%) i/s -      6.000  in   5.273052s
         ClosureTree      0.334  (± 0.0%) i/s -      2.000  in   5.990462s

Comparison:
            Ancestry:        1.1 i/s
         ClosureTree:        0.3 i/s - 3.41x  slower


==================== Select benchmark ====================
==================== ancestors ====================
Warming up --------------------------------------
            Ancestry   141.000  i/100ms
          CosureTree    69.000  i/100ms
Calculating -------------------------------------
            Ancestry      1.408k (± 5.0%) i/s -      7.191k in   5.127646s
          CosureTree    702.220  (± 2.7%) i/s -      3.519k in   5.015152s

Comparison:
            Ancestry:     1407.6 i/s
          CosureTree:      702.2 i/s - 2.00x  slower

==================== descendants ====================
Warming up --------------------------------------
            Ancestry   144.000  i/100ms
         ClosureTree    69.000  i/100ms
Calculating -------------------------------------
            Ancestry      1.455k (± 2.5%) i/s -      7.344k in   5.051300s
         ClosureTree    693.089  (± 4.9%) i/s -      3.519k in   5.090211s

Comparison:
            Ancestry:     1454.9 i/s
         ClosureTree:      693.1 i/s - 2.10x  slower


==================== Move node benchmark ====================

==================== Moving a node with 14 descendants: ====================
Warming up --------------------------------------
            Ancestry     1.000  i/100ms
         ClosureTree     1.000  i/100ms
Calculating -------------------------------------
            Ancestry     19.064  (± 5.2%) i/s -     96.000  in   5.052685s
         ClosureTree      3.964  (± 0.0%) i/s -     20.000  in   5.074625s

Comparison:
            Ancestry:       19.1 i/s
         ClosureTree:        4.0 i/s - 4.81x  slower


==================== Moving a node with 25 descendants: ====================
Warming up --------------------------------------
            Ancestry     1.000  i/100ms
         ClosureTree     1.000  i/100ms
Calculating -------------------------------------
            Ancestry     10.829  (± 9.2%) i/s -     54.000  in   5.047818s
         ClosureTree      2.385  (± 0.0%) i/s -     12.000  in   5.039403s

Comparison:
            Ancestry:       10.8 i/s
         ClosureTree:        2.4 i/s - 4.54x  slower
```
