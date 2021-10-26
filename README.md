```bash
$ rails runner bin/benchmark.rb

Resetting DB
------------


========================= Populating data =========================
==================== Deep Nested ====================
Warming up --------------------------------------
            Ancestry     1.000  i/100ms
         ClosureTree     1.000  i/100ms
           Recursive     1.000  i/100ms
Calculating -------------------------------------
            Ancestry      6.898  (± 0.0%) i/s -     35.000  in   5.098421s
         ClosureTree      2.768  (± 0.0%) i/s -     14.000  in   5.065267s
           Recursive      6.275  (± 0.0%) i/s -     32.000  in   5.128794s

Comparison:
            Ancestry:        6.9 i/s
           Recursive:        6.3 i/s - 1.10x  (± 0.00) slower
         ClosureTree:        2.8 i/s - 2.49x  (± 0.00) slower

==================== Shallow Nested ====================
Warming up --------------------------------------
            Ancestry     1.000  i/100ms
         ClosureTree     1.000  i/100ms
           Recursive     1.000  i/100ms
Calculating -------------------------------------
            Ancestry     12.508  (± 8.0%) i/s -     63.000  in   5.073163s
         ClosureTree      4.806  (± 0.0%) i/s -     24.000  in   5.025987s
           Recursive     11.088  (± 9.0%) i/s -     56.000  in   5.073089s

Comparison:
            Ancestry:       12.5 i/s
           Recursive:       11.1 i/s - same-ish: difference falls within error
         ClosureTree:        4.8 i/s - 2.60x  (± 0.00) slower


========================= Select benchmark =========================
==================== ancestors ====================
Warming up --------------------------------------
            Ancestry   102.000  i/100ms
          CosureTree    60.000  i/100ms
           Recursive    94.000  i/100ms
Calculating -------------------------------------
            Ancestry      1.048k (± 9.5%) i/s -      5.202k in   5.009618s
          CosureTree    598.182  (± 5.5%) i/s -      3.000k in   5.029955s
           Recursive    929.874  (± 8.3%) i/s -      4.700k in   5.091821s

Comparison:
            Ancestry:     1047.5 i/s
           Recursive:      929.9 i/s - same-ish: difference falls within error
          CosureTree:      598.2 i/s - 1.75x  (± 0.00) slower

==================== descendants ====================
Warming up --------------------------------------
            Ancestry   105.000  i/100ms
         ClosureTree    63.000  i/100ms
           Recursive   104.000  i/100ms
Calculating -------------------------------------
            Ancestry      1.018k (±10.4%) i/s -      5.145k in   5.120158s
         ClosureTree    575.123  (±17.2%) i/s -      2.835k in   5.108137s
           Recursive    895.281  (±12.6%) i/s -      4.472k in   5.084126s

Comparison:
            Ancestry:     1018.0 i/s
           Recursive:      895.3 i/s - same-ish: difference falls within error
         ClosureTree:      575.1 i/s - 1.77x  (± 0.00) slower


========================= Move benchmark =========================

==================== Moving a node with 14 descendants: ====================
Warming up --------------------------------------
            Ancestry     1.000  i/100ms
         ClosureTree     1.000  i/100ms
           Recursive     8.000  i/100ms
Calculating -------------------------------------
            Ancestry     16.113  (±12.4%) i/s -     79.000  in   5.032809s
         ClosureTree      3.529  (± 0.0%) i/s -     18.000  in   5.126059s
           Recursive     76.214  (±10.5%) i/s -    376.000  in   5.003223s

Comparison:
           Recursive:       76.2 i/s
            Ancestry:       16.1 i/s - 4.73x  (± 0.00) slower
         ClosureTree:        3.5 i/s - 21.59x  (± 0.00) slower


==================== Moving a node with 25 descendants: ====================
Warming up --------------------------------------
            Ancestry     1.000  i/100ms
         ClosureTree     1.000  i/100ms
           Recursive     8.000  i/100ms
Calculating -------------------------------------
            Ancestry      9.060  (±22.1%) i/s -     43.000  in   5.045902s
         ClosureTree      1.454  (± 0.0%) i/s -      8.000  in   5.568127s
           Recursive     78.986  (± 7.6%) i/s -    400.000  in   5.097757s

Comparison:
           Recursive:       79.0 i/s
            Ancestry:        9.1 i/s - 8.72x  (± 0.00) slower
         ClosureTree:        1.5 i/s - 54.32x  (± 0.00) slower
```