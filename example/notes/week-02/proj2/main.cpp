#include <nlohmann/json.hpp>

#include <iostream>

auto main() -> int {
    auto j = nlohmann::json{{
        {"a", 123}
    }};
    std::cout << j << std::endl;
}