# C++ Limit Order Book
In reality, this repo contains two implementations. The main one is in `src/orderbook.h`. This one uses a `unordered_map` as a shortcut to the limits in order to get a time complexity of O(0) on insertions (unless the limit does not exist yet). The one in `src/linear/orderbook.h`, as the name suggests, has inserts in O(n) as it keeps the limits in a linked list.

### Benchmark
Running the `make benchmark` runs a simple benchmark. This implementation is able to perform 3.5 million insertions per second.