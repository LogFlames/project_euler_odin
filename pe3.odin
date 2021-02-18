package main

import "core:math"
import "core:fmt"

main :: proc() {
    num : int = 600851475143;
    numSqrt : int = int(math.sqrt_f64(f64(num)));
    primes := generate_primes(numSqrt);

    for p in primes {
        for num % p == 0 {
            num /= p;
        }

        if num == 1 {
            num = p;
            break;
        }
    }

    fmt.println(num);
}

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