#include <benchmark/benchmark.h>

#include <chrono>
#include <thread>

using namespace std::chrono_literals;

auto SomeFunction() -> void{
    std::this_thread::sleep_for(1ms);
}

static void BM_SomeFunction(benchmark::State& state) {
  for (auto _ : state) {
    SomeFunction();
  }
}
// Register the function as a benchmark
BENCHMARK(BM_SomeFunction);

// Run the benchmark
BENCHMARK_MAIN();
