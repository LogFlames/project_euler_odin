package primes

import "core:math"

generate_primes :: proc(n: int) -> [dynamic]int {
    upperLimit : int = int(math.sqrt_f64(f64(n)));
    potPrimesCount : int = (n - 1) / 2;
    potPrimes := make([dynamic]int, potPrimesCount, potPrimesCount);

    for i in 0..<potPrimesCount {
        potPrimes[i] = i * 2 + 3;
    }

    for i in 0..<potPrimesCount {
        if potPrimes[i] == -1 {
            continue;
        }

        if potPrimes[i] > upperLimit {
            break;
        }

        for j := i + potPrimes[i]; j < potPrimesCount; j += potPrimes[i] {
            potPrimes[j] = -1;
        }
    }

    primes: [dynamic]int = {2};

    for pp in potPrimes {
        if pp != -1 {
            append(&primes, pp);
        }
    }

    return primes;
}