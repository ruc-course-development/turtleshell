#include <gperftools/profiler.h>

#include <chrono>
#include <thread>

using namespace std::chrono_literals;

auto SomeFunction() -> void{
    for (auto i = 0; i < 10; ++i)
        std::this_thread::sleep_for(1ms);
}

int main() {
    ProfilerStart("./my_profile.prof");

    SomeFunction();

    // Stop the profiler
    ProfilerStop();

    return 0;
}